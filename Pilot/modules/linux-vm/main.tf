#resource "tls_private_key" "example_ssh" {
#  algorithm = "RSA"
#  rsa_bits  = 4096
#}

#output "tls_private_key" { value = "tls_private_key.example_ssh.private_key_pem" }

resource "azurerm_linux_virtual_machine" "myterraformvm" {
  name                  = var.vm_name
  location              = var.vm_location
  availability_set_id   = var.aset_id
  resource_group_name   = var.vm_rgname
  network_interface_ids = var.vmnic_id
  size                  = var.vm_size

  os_disk {
    name                 = var.osdisk_name
    caching              = "ReadWrite"
    storage_account_type = var.storageac_type
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  # os_profile {
  #  computer_name  = var.computer_name
  # admin_username = "testadmin"
  # admin_password = "Password1234!"
  #}
  #os_profile_linux_config {
  #  disable_password_authentication = false
  #}

  computer_name                   = var.computer_name
  admin_username                  = "testadmin"
  admin_password                  = "Password1234!"
  disable_password_authentication = false

  #  admin_ssh_key {
  #    username   = var.user_name
  #    public_key = tls_private_key.example_ssh.public_key_openssh
  #  }

  boot_diagnostics {
    storage_account_uri = var.vmstorage_uri
  }

  tags = var.vm_tags
}
