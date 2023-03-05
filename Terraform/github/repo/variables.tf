variable "repo_name" {
  description = "The Name of the repository"
  type        = string
  default     = "Test Terraform Repo"
}

variable "token" {
  description = "The token for Github"
  type        = string
  sensitive   = true
  default     = XX_TOKEN
}
