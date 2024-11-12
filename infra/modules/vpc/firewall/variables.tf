variable "firewall_name" {
  description = "The name of the firewall rule"
  type        = string
  default     = "allow-gke-to-cloudsql"
}

variable "network" {
  description = "The self-link or name of the VPC network where the firewall rule applies"
  type        = string
}

variable "ports" {
  description = "List of ports to allow in the firewall rule"
  type        = list(string)
  default     = ["5432"] # Default for PostgreSQL
}

variable "source_tags" {
  description = "List of source tags for the firewall rule, typically the GKE node tag"
  type        = list(string)
  default     = ["gke-cloudsql-access"]
}

variable "target_tags" {
  description = "List of target tags for the firewall rule, typically the Cloud SQL instance tag"
  type        = list(string)
  default     = ["cloudsql-instance"]
}
