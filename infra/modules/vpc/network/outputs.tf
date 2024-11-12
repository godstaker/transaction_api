# outputs.tf

# Output the name of the VPC network
output "vpc_network_name" {
  description = "The name of the VPC network"
  value       = google_compute_network.this.name
}

output "subnet_name" {
  description = "The name of the VPC subnet"
  value       = google_compute_subnetwork.this.name
}

# Output the ID of the VPC network
output "vpc_network_id" {
  description = "The ID of the VPC network"
  value       = google_compute_network.this.id
}

# Output the self-link of the VPC network
output "vpc_network_self_link" {
  description = "The self-link of the VPC network"
  value       = google_compute_network.this.self_link
}

# Output the gateway IPv4 address of the VPC network
output "vpc_network_gateway_ipv4" {
  description = "The gateway IPv4 address of the VPC network"
  value       = google_compute_network.this.gateway_ipv4
}
