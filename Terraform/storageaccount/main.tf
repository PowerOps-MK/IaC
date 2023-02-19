provider "azurerm" {
  version = "=3.44.1"
  features {} #This is required for v2 of the provider even if empty or plan will fail
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
