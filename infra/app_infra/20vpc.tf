module "app_vpc" {
  source       = "../modules/vpc/network"
  network_name = var.network_name
  subnet_name  = var.subnet_name
  cidr_range   = var.cidr_range
  region       = var.region
  project_id   = var.project_id
}
