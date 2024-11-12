module "google_apis" {
  source     = "../modules/gcp_apis"
  project_id = var.project_id
}
