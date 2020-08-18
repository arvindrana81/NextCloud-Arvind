variable "appgateway_name" {
  description="provide the application gateway name"
}

variable "gwrg_name" {
  description="provide the gateway rg name"
}

variable "gw_loc" {
  description="provide the gateway rg location"
}

variable "subnet_id" {
  description="provide the subnet id to link this to waf - azurerm_subnet.frontend.id"
}

variable "frontend_port_name" {
  description="provide the frontend port name"
}

variable "frontend_ip_configuration_name" {
  description="provide the frontend public ip configuration name"
}

variable "gw_pip" {
  description="provide the gateway public ip id"
}

variable "backend_address_pool_name" {
  description="provide the backend address pool name"
}

variable "http_setting_name" {
  description="provide the http setting name"
}

variable "listener_name" {
  description="provide the listener name"
}

variable "request_routing_rule_name" {
  description="provide the request routing rule name"
}
