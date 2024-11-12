# outputs.tf
output "instance_name" {
  description = "Name of the Cloud SQL instance"
  value       = google_sql_database_instance.instance.name
}

output "private_ip_address" {
  description = "Private IP address range allocated for the Cloud SQL instance"
  value       = google_compute_global_address.private_ip_address.address
}
