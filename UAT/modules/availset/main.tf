resource "azurerm_availability_set" "availabilityset" {
  name                         = var.aset_name
  location                     = var.asetrg_loc
  resource_group_name          = var.asetrg_name
  platform_fault_domain_count  = var.faultdomain_count
  platform_update_domain_count = var.updatedomain_count
  managed                      = true

  tags = var.aset_tags
}

