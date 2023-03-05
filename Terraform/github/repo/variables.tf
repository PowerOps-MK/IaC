variable "token" {
  description = "The token for Github"
  type        = string
  sensitive   = true
  default     = "XX_TOKEN"
}

variable "repo_name" {
  description = "The Name of the repository"
  type        = string
  default     = "Test-terraform"
}

variable "branch_name" {
  description = "The Name of the default branch"
  type        = string
  default     = "master"
}
