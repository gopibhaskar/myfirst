resource "azurerm_resource_group" "example" {
  name     = "${var.rmname}"
  location = "${var.location}"
}

resource "azurerm_storage_account" "example" {
  name                     = "${var.storage_account}"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "${var.environment}"
  }
}

resource "azurerm_storage_container" "example" {
  name                  = "${var.storagecon_name}"
  storage_account_name  = azurerm_storage_account.example.name
  container_access_type = "private"
}