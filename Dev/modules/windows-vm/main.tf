resource "azurerm_windows_virtual_machine" "myterraformvm" {
  name                  = var.winvm_name
  resource_group_name   = var.vmrg_name
  location              = var.vm_loc
  availability_set_id   = var.aset_id
  size                  = var.vm_size
  admin_username        = "testadmin"
  admin_password        = "Password1234!"
  network_interface_ids = var.vmnic_id

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }

  boot_diagnostics {
    storage_account_uri = var.vmstorage_uri
  }

  tags = var.vm_tags
}
