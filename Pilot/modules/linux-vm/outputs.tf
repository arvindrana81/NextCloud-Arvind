output "vm_name" {
  value = azurerm_linux_virtual_machine.myterraformvm.name
}

output "vm_ids" {
  value = azurerm_linux_virtual_machine.myterraformvm.*.id
}