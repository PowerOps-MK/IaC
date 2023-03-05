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
  visibility         = var.repo_type
  has_issues         = true
  has_wiki           = true
  has_projects       = true
  auto_init          = true
  license_template   = "lgpl-3.0"
  gitignore_template = "Python"
}

resource "github_branch_default" "default" {
  repository = github_repository.repo.name
  branch     = var.branch_name
  rename     = true
}

data "github_repository_file" "source_linter" {
  repository          = "Coding"
  branch              = github_branch_default.default.branch
  file                = "render.yaml"
}

resource "github_repository_file" "linter" {
  repository          = github_repository.repo.name
  branch              = github_branch_default.default.branch
  file                = "super-linter.yml"
  content             = data.github_repository_file.source_linter.content
}
