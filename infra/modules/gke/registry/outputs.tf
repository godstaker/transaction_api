# outputs.tf

output "repository_name" {
  description = "The name of the created Artifact Registry repository."
  value       = google_artifact_registry_repository.this.name
}

output "repository_id" {
  description = "The URL of the created Artifact Registry repository."
  value       = google_artifact_registry_repository.this.id
}
