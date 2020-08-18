variable "nic_name" {
  description = "provide the nic name"
}

variable "nic_loc" {
  description = "provide the nic rg location"
}

variable "nicrg_name" {
  description = "provie the name of the rg for this nic"
}

variable "nicconfig_name" {
  description = "provide the nic configuration name"
}

variable "subnet_id" {
  description = "provide the subnet id for this nic (azurerm_subnet.myterraformsubnet.id)"
}

variable "privateip_allocation" {
  description = "provide the private ip allocation method, dynamic or static"
}

#variable "pip_id" {
#  description = "provide the puplic ip id for this nic (azurerm_public_ip.myterraformpublicip.id)"
#}

variable "nic_tags" {
  description = "provie the tag for this nic card"
}

variable "nic_id" {
 description = "provide the nic id (azurerm_network_interface.myterraformnic.id)"
}

variable "nsg_id" {
  description = "provide the nsg id (azurerm_network_security_group.myterraformnsg.id)"
}

variable "appgw_beid" {
  description="provide the application gateway backend address pool id - azurerm_application_gateway.network.backend_address_pool[0].id"
}
variable "ipconfig_name" {
  description="provide the ip configuration name for the backend pool association"
}

