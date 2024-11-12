variable "project_id" {
  description = "The ID of the project where APIs will be enabled"
  type        = string
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
