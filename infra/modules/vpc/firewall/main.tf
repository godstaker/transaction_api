resource "google_compute_firewall" "this" {
  name    = var.firewall_name
  network = var.network

  allow {
    protocol = "tcp"
    ports    = var.ports
  }

  source_tags = var.source_tags
  target_tags = var.target_tags
}
