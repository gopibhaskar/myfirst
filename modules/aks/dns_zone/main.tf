resource "azurerm_resource_group" "example" {
  name     = "${var.rmname}"
  location = "${var.location}"
}

resource "azurerm_private_dns_zone" "example" {
  name                = "${var.private_dns_zname}"
  resource_group_name = azurerm_resource_group.example.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "example" {
  name                  = "${var.private_dns_vn_name}"
  resource_group_name   = azurerm_resource_group.example.name
  private_dns_zone_name = azurerm_private_dns_zone.example.name
  virtual_network_id    = azurerm_virtual_network.example.id
}