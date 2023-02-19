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
  resource_group_name      = "Test-RG"
  location                 = "West Europe"
  account_tier             = "Standard"
  account_replication_type = "GRS" 
  min_tls_version          = "TLS1_2"

  network_rules {
     default_action             = "Deny"
     bypass                     = ["Metrics", "AzureServices"]
  }
}
