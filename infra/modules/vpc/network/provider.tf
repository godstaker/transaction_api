provider "google" {
  project = var.project_id # Reference the project ID from a variable or use a hardcoded value
  region  = var.region     # Specify the region for resources
}