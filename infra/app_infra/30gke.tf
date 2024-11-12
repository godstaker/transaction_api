module "block_api_cluster" {
  source       = "../modules/gke/cluster"
  project_id   = var.project_id
  region       = var.region
  cluster_name = var.cluster_name
  network_name = module.app_vpc.vpc_network_name
  subnet_name  = module.app_vpc.subnet_name
}

module "docker_registry" {
  source        = "../modules/gke/registry"
  project_id    = var.project_id
  region        = var.region
  repository_id = var.repository_id
}
