output "firewall_name" {
  description = "The name of the firewall rule"
  value       = google_compute_firewall.this.name
}

output "firewall_id" {
  description = "The ID of the firewall rule"
  value       = google_compute_firewall.this.id
}
