# variables.tf

variable "project_id" {
  description = "The ID of the project in which to create the Artifact Registry."
  type        = string
}

variable "region" {
  description = "The region in which to create the Artifact Registry repository."
  type        = string
  default     = "europe-west2"
}

variable "repository_id" {
  description = "The ID of the repository to create."
  type        = string
}

variable "description" {
  description = "Description for the Artifact Registry repository."
  type        = string
  default     = "Artifact Registry Repository"
}

variable "format" {
  description = "The format of packages stored in the repository. Allowed values are DOCKER, MAVEN, NPM, PYTHON, APT, YUM."
  type        = string
  default     = "DOCKER"
}

variable "iam_members" {
  description = "List of IAM members with roles to set on the repository. Example: [{ role = 'roles/viewer', member = 'user:example@gmail.com' }]"
  type = list(object({
    role   = string
    member = string
  }))
  default = []
}
