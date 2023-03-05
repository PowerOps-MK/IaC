terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.44.1"
    }
  }

  required_version = ">= 1.3.9"
}

provider "azurerm" {
  features {}
}

resource "azurerm_storage_account" "testmrphead626" {
  name                     = var.storageaccountName
}
