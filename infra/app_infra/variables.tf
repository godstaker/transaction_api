variable "gcs_tf_bucket" {
  description = "The GCS bucket used for Terraform state"
  type        = string
}

variable "project_id" {
  description = "The ID of the project where APIs will be enabled"
  type        = string
  default     = ""
}

variable "network_name" {
  description = "VPC network name"
  type        = string
}

variable "subnet_name" {
  description = "Subnet name"
  type        = string
}

variable "cidr_range" {
  description = "CIDR range for the subnet"
  type        = string
  default     = ""
}

variable "region" {
  description = "Region for the subnet"
  type        = string
}

variable "cluster_name" {
  description = "The name of the GKE cluster."
  type        = string
}

variable "repository_id" {
  description = "The ID of the repository to create."
  type        = string
}

variable "name_prefix" {
  description = "Prefix for naming resources created by the module"
  type        = string
  default     = "private"
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