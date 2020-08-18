output "vm_name" {
  value = azurerm_windows_virtual_machine.myterraformvm.name
}

output "vm_ids" {
  value = azurerm_windows_virtual_machine.myterraformvm.*.id
}