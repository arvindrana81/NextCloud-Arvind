variable "vm_name" {
  description = " provide the vm name"
}

variable "vm_location" {
  description = "provide the vm location"
}

variable "vm_rgname" {
  description = "provide the vm rg name"
}

variable "vmnic_id" {
  description = "provide the vm nic id to attach to, azurerm_network_interface.myterraformnic.id"
}
variable "vm_size" {
  description = "provide the vm size, Standard_DS1_v2, Standard_B2ms"
}

variable "osdisk_name" {
  description = "provide the os disk name"
}

variable "storageac_type" {
  description = "provide the storage account type, Standard_LRS, Premium_LRS "
}

variable "computer_name" {
  description = "provide the computer name"
}

#variable "user_name" {
#  description = "provide the vm user admin name"
#}

variable "vmstorage_uri" {
  description = "provide the storage uri for this vm - azurerm_storage_account.mystorageaccount.primary_blob_endpoint"
}

variable "vm_tags" {
  description = "provide the tags for this vm"
}

variable "aset_id" {
  description = "provide the availability set id"
}
