output "appgw_id" {
    value = azurerm_application_gateway.network.backend_address_pool[0].id
}

#azurerm_application_gateway.network.backend_address_pool[0].id