provider "google" {
  project = var.project_id
  region  = var.region
}

# Create GKE Cluster with Workload Identity enabled
resource "google_container_cluster" "this" {
  name                     = var.cluster_name
  location                 = var.region
  network                  = var.network_name
  subnetwork               = var.subnet_name
  enable_autopilot         = true
  enable_l4_ilb_subsetting = true

  # Enable Private Cluster for additional network security (optional)
  private_cluster_config {
    enable_private_nodes   = true
    master_ipv4_cidr_block = "172.16.0.0/28" # Adjust if needed
  }

  # Enable Workload Identity
  workload_identity_config {
    workload_pool = "${var.project_id}.svc.id.goog"
  }

  deletion_protection = false
}

# Service Account for the GKE nodes (used by the node pool, but not for workloads)
resource "google_service_account" "node_service_account" {
  account_id   = "gke-node-sa"
  display_name = "GKE Node Service Account"
  project      = var.project_id
}

# Define the Node Pool and associate it with the node-level service account
resource "google_container_node_pool" "primary_pool" {
  cluster    = google_container_cluster.this.name
  location   = google_container_cluster.this.location
  node_count = var.node_count

  node_config {
    machine_type    = var.node_machine_type
    oauth_scopes    = ["https://www.googleapis.com/auth/cloud-platform"]
    service_account = google_service_account.node_service_account.email
    tags            = var.node_tags
  }
}

# Create a Kubernetes Service Account for the workload
resource "kubernetes_service_account" "ksa_cloudsql" {
  metadata {
    name      = "ksa-cloudsql"
    namespace = "default" # Adjust the namespace as needed
    annotations = {
      "iam.gke.io/gcp-service-account" = google_service_account.workload_identity_sa.email
    }
  }
}

# Google Cloud Service Account specifically for Workload Identity
resource "google_service_account" "workload_identity_sa" {
  account_id   = "workload-identity-sa"
  display_name = "Service Account for Workload Identity"
  project      = var.project_id
}

# IAM binding for the Google Cloud Service Account to access Cloud SQL
resource "google_project_iam_member" "cloudsql_access" {
  project = var.project_id
  role    = "roles/cloudsql.client"
  member  = "serviceAccount:${google_service_account.workload_identity_sa.email}"
}

# IAM binding for the Kubernetes Service Account to impersonate the Google Cloud Service Account
resource "google_service_account_iam_member" "workload_identity_binding" {
  service_account_id = google_service_account.workload_identity_sa.name
  role               = "roles/iam.workloadIdentityUser"
  member             = "serviceAccount:${var.project_id}.svc.id.goog[default/ksa-cloudsql]"
}
