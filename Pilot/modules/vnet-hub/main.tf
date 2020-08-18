resource "azurerm_virtual_network" "myterraformnetwork" {
  name                = var.vnet_name
  address_space       = var.addr_space
  location            = var.vnet_loc
  resource_group_name = var.vnetrg_name

  tags = var.vnet_tags
}
