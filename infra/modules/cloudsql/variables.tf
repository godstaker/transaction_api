variable "project_id" {
  type = string
}

variable "network_id" {
  description = "Name of the VPC network for private IP connectivity"
  type        = string
}

variable "network_self_link" {
  type = string
}

variable "name_prefix" {
  description = "Prefix for naming resources created by the module"
  type        = string
  default     = "private"
}

variable "region" {
  description = "Region for the Cloud SQL instance"
  type        = string
  default     = "europe-west2"
}

variable "instance_tier" {
  description = "Machine type tier for the Cloud SQL instance"
  type        = string
  default     = "db-f1-micro"
}

variable "database_version" {
  description = "Version of the Cloud SQL database engine"
  type        = string
  default     = "POSTGRES_15"
}

variable "prefix_length" {
  description = "Prefix length for the VPC peering range"
  type        = number
  default     = 16
}

variable "enable_private_path" {
  description = "Enable private path for Google Cloud Services"
  type        = bool
  default     = true
}

variable "db_name" {
  type        = string
  description = "Database name"
}


