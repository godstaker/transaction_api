output "cluster_name" {
  description = "The name of the GKE cluster."
  value       = google_container_cluster.this.name
}

output "cluster_endpoint" {
  description = "The endpoint of the GKE cluster."
  value       = google_container_cluster.this.endpoint
}

output "cluster_ca_certificate" {
  description = "The cluster CA certificate (for secure connections)."
  value       = google_container_cluster.this.master_auth.0.cluster_ca_certificate
}

output "cluster_network" {
  description = "The VPC network associated with the GKE cluster."
  value       = google_container_cluster.this.network
}

output "cluster_subnet" {
  description = "The subnet associated with the GKE cluster."
  value       = google_container_cluster.this.subnetwork
}
