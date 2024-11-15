resource "google_compute_network" "this" {
  name                    = var.network_name
  auto_create_subnetworks = false
}

# Class C Subnet for GKE and Cloud SQL with Private Google Access enabled
resource "google_compute_subnetwork" "this" {
  name                     = var.subnet_name
  ip_cidr_range            = var.cidr_range
  region                   = var.region
  network                  = google_compute_network.this.id
  private_ip_google_access = true # Enables Private Google Access for GKE and Cloud SQL

  log_config {
    aggregation_interval = "INTERVAL_10_MIN"
    flow_sampling        = 0.5
    metadata             = "INCLUDE_ALL_METADATA"
  }
}