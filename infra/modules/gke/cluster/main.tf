provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_container_cluster" "this" {
  name                     = var.cluster_name
  location                 = var.region
  network                  = var.network_name
  subnetwork               = var.subnet_name
  enable_autopilot         = true
  enable_l4_ilb_subsetting = true

  # Enable Private Cluster if you want additional network security (optional)
  private_cluster_config {
    enable_private_nodes   = true
    master_ipv4_cidr_block = "172.16.0.0/28" # Adjust if needed
  }

  # Service account for the GKE nodes
  node_config {
    machine_type    = var.node_machine_type
    oauth_scopes    = ["https://www.googleapis.com/auth/cloud-platform"]
    service_account = google_service_account.this.account_id
    tags            = var.node_tags
  }
  deletion_protection      = false
}

resource "google_service_account" "this" {
  account_id   = "gke-node-sa"
  display_name = "GKE Node Service Account"
  project      = var.project_id
}

# IAM permissions for the GKE service account to access Cloud SQL (optional if using Cloud SQL Proxy)
resource "google_project_iam_member" "this" {
  project = var.project_id
  role    = "roles/cloudsql.client"
  member  = "serviceAccount:${google_service_account.this.email}"
}