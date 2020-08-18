resource "azurerm_network_interface" "myterraformnic" {
    name                        = var.nic_name
    location                    = var.nic_loc
    resource_group_name         = var.nicrg_name

    ip_configuration {
        name                          = var.nicconfig_name
        subnet_id                     = var.subnet_id
        private_ip_address_allocation = var.privateip_allocation
        #public_ip_address_id          = var.pip_id
    }

    tags = var.nic_tags 
}

# Connect the security group to the network interface
resource "azurerm_network_interface_security_group_association" "nsg_nic_association" {
    network_interface_id      = var.nic_id
    network_security_group_id = var.nsg_id
}
