resource "azurerm_resource_group" "example" {
  name     = "${var.rmname}-k8s"
  location = "${var.location}"
}

resource "azurerm_storage_account" "example" {
  name                     = "${var.storagename}-k8s"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_share" "example" {
  name                 = "${var.sharename}-k8s"
  storage_account_name = azurerm_storage_account.example.name
  quota                = 50
}

resource "azurerm_storage_share_file" "example" {
  name             = "${var.storagesharename}-k8s.zip"
  storage_share_id = azurerm_storage_share.example.id
  source           = "some-local-file.zip"
}