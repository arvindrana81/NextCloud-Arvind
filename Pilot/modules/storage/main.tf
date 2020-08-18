resource "azurerm_storage_account" "mystorageaccount" {
  name                     = var.sa_name
  resource_group_name      = var.sarg_name
  location                 = var.sa_location
  account_replication_type = var.sarepl_type
  account_tier             = var.sa_acctype

  tags = var.sa_tags
}
