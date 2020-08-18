resource "azurerm_public_ip" "myterraformpublicip" {
    name                         = var.pip_name
    location                     = var.piprg_location
    resource_group_name          = var.piprg_name
    allocation_method            = var.pipallocation_method

    tags = var.pip_tags
}
