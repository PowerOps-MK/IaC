resource "azurerm_resource_group" "Test-RG" {
  name     = "Test-RG"
  location = "West Europe"
}

resource "azurerm_storage_account" "testmrphead626" {
  name                     = "testmrphead626"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "GRS" 
}
