variable "project_id" {
  description = "The ID of the project where APIs will be enabled"
  type        = string
}

variable "api_services" {
  description = "List of APIs to enable in the project"
  type        = list(string)
  default = [
    # Required for GKE
    "container.googleapis.com",
    "containerregistry.googleapis.com",
    "artifactregistry.googleapis.com",
    "compute.googleapis.com",
    "iam.googleapis.com",
    "servicenetworking.googleapis.com",
    # Required for Cloud SQL
    "sqladmin.googleapis.com"
  ]
}
