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
  description        = "A private-visible repository created by Terraform"
  visibility         = "private"
  has_issues         = true
  auto_init          = true
  license_template   = "lgpl-3.0"
  gitignore_template = "Python"
}

data "github_repository_file" "source_linter" {
  repository          = "IaC"
  branch              = "main"
  file                = var.linter_file
}

resource "github_repository_file" "linter" {
  repository          = github_repository.repo.name
  branch              = "main"
  file                = var.linter_file
  content             = data.github_repository_file.source_linter.content
}
