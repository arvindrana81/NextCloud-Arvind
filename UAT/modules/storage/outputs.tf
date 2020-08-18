# Output variable definitions

output "storage_name" {
  value = azurerm_storage_account.mystorageaccount.name
}

output "storage_endpoint" {
  value = azurerm_storage_account.mystorageaccount.primary_blob_endpoint
}

output "storage_access_key" {
  value = azurerm_storage_account.mystorageaccount.primary_access_key
}
