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

resource "azurerm_resource_group" "Test-RG" {
  name     = "Test-RG"
  location = "West Europe"
}

resource "azurerm_storage_account" "testmrphead626" {
  name                     = var.storageaccountName
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "GRS" 
  min_tls_version          = "TLS1_2"
}

resource "azurerm_storage_account_network_rules" "rules" {
  storage_account_id = azurerm_storage_account.testmrphead626.id

  default_action             = "Deny"
  bypass                     = ["AzureServices"]
}
