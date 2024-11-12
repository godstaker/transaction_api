# main.tf
resource "google_artifact_registry_repository" "this" {
  provider      = google
  project       = var.project_id
  location      = var.region
  repository_id = var.repository_id
  description   = var.description

  # Repository type (DOCKER, MAVEN, NPM, PYTHON, etc.)
  format = var.format
}

# IAM bindings for Artifact Registry (optional)
resource "google_artifact_registry_repository_iam_member" "members" {
  for_each = { for member in var.iam_members : "${member.role}-${member.member}" => member }

  repository = google_artifact_registry_repository.this.name
  role       = each.value.role
  member     = each.value.member
}
