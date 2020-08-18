resource "azurerm_resource_group" "myterraformgroup" {
  name     = var.rg_name
  location = var.rg_location

  tags = {
    Environment = "ADDA Demo"
  }
}
