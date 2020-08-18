resource "azurerm_subnet" "myterraformsubnet" {
  name                 = var.sub_name
  resource_group_name  = var.subrg_name
  virtual_network_name = var.subvnet_name
  address_prefixes     = var.subaddr_prefix
  #tags                 = var.subnet_tags
}
