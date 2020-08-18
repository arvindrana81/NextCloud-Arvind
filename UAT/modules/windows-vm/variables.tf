variable "winvm_name" {
  description = "provide the vm name"
}

variable "vmrg_name" {
  description = "provide the vm rg name"
}

variable "vm_loc" {
  description = "provide the vm location"
}

variable "vm_size" {
  description = "provide the vm size, Standard_B2ms"
}

variable "vmstorage_uri" {
  description = "provide the vm storage uri"
}

variable "vm_tags" {
  description = "provide the vm tags, environment"
}

variable "aset_id" {
  description = "provide the availability set id"
}

variable "vmnic_id" {
  description = "provide the vm nic id to attach to, azurerm_network_interface.myterraformnic.id"
}
