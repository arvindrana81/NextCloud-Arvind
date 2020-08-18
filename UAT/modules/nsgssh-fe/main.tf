resource "azurerm_network_security_group" "myterraformnsgssh" {
  name                = var.nsg_name
  location            = var.nsg_loc
  resource_group_name = var.nsgrg_name

  security_rule {
    name                       = "SSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = var.nsg_tags
}