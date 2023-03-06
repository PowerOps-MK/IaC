variable "token" {
  description = "The token for Github"
  type        = string
  sensitive   = true
  default     = "XX_TOKEN"
}

variable "repo_name" {
  description = "The Name of the repository"
  type        = string
  default     = "ansible-unifi"
}

variable "linter_file" {
  description = "The filepath of the linter workflow"
  type        = string
  default     = ".github/workflows/super-linter.yml"
}
