terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
  }
}

provider "github" {
  token = var.token
}

resource "github_repository" "repo" {
  name               = var.repo_name
  description        = "Terraform test"
  visibility         = "public"
  has_issues         = true
  auto_init          = true
  license_template   = "mit"
  gitignore_template = "Python"
}
