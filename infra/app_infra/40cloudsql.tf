module "block_db" {
  source              = "../modules/cloudsql"
  project_id          = var.project_id
  name_prefix         = var.name_prefix
  prefix_length       = var.prefix_length
  network_id          = module.app_vpc.vpc_network_id
  region              = var.region
  database_version    = var.database_version
  instance_tier       = var.instance_tier
  network_self_link   = module.app_vpc.vpc_network_self_link
  enable_private_path = var.enable_private_path
  db_name             = var.db_name
}
