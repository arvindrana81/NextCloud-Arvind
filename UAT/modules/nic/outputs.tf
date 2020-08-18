output "nic_id" {
  value = azurerm_network_interface.myterraformnic.id
}

output "nicconfig_name" {
  value = azurerm_network_interface.myterraformnic.ip_configuration[0].name
}