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
  license_template   = "lgpl-3.0"
  gitignore_template = "Python"
}

resource "github_branch_default" "default" {
  repository = github_repository.repo.name
  branch     = "master"
  rename     = true
}
