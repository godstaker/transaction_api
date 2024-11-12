variable "project_id" {
  description = "The ID of the GCP project to host the GKE cluster."
  type        = string
}

variable "region" {
  description = "The region where the GKE cluster will be deployed."
  type        = string
}

variable "cluster_name" {
  description = "The name of the GKE cluster."
  type        = string
}

variable "network_name" {
  description = "The name of the VPC network where the GKE cluster will be deployed."
  type        = string
}

variable "subnet_name" {
  description = "The name of the subnet where the GKE cluster nodes will be deployed."
  type        = string
}

variable "node_count" {
  description = "The initial number of nodes in the GKE cluster."
  type        = number
  default     = 3
}

variable "node_machine_type" {
  description = "The machine type for the GKE cluster nodes."
  type        = string
  default     = "e2-medium"
}

variable "node_tags" {
  description = "List of network tags to attach to each GKE node."
  type        = list(string)
  default     = []
}

variable "min_node_count" {
  description = "Minimum number of nodes for autoscaling."
  type        = number
  default     = 1
}

variable "max_node_count" {
  description = "Maximum number of nodes for autoscaling."
  type        = number
  default     = 3
}

variable "enable_network_policy" {
  description = "Enable network policy for the GKE cluster (for additional security)."
  type        = bool
  default     = false
}