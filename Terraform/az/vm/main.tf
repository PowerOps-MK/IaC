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

resource "azurerm_virtual_network" "vnet" {
  name                     = "test-vnet"
  address_space            = ["10.0.0.0/16"]
  resource_group_name      = "Test-RG"
  location                 = "West Europe"
}

resource "azurerm_subnet" "subnet" {
  name                     = "internal"
  resource_group_name      = "Test-RG"
  virtual_network_name     = azurerm_virtual_network.vnet.name
  address_prefixes         = ["10.0.0.0/24"]
}

resource "azurerm_network_interface" "nic" {
  name                     = "vmtest-nic"
  resource_group_name      = "Test-RG"
  location                 = "West Europe"

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "vmtest" {
  name                     = var.vmName
  resource_group_name      = "Test-RG"
  location                 = "West Europe"
  size                     = "Standard_DS1_v2"
  admin_username           = "adminuser"
  network_interface_ids = [
    azurerm_network_interface.nic.id,
  ]

  admin_ssh_key {
    username   = "adminuser"
    public_key = file("~/.ssh/id_rsa.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
}
