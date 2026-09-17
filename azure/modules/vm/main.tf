resource "azurerm_linux_virtual_machine" "linux_vm" {
  for_each = var.vm_config

  name                  = each.value.vm_name
  resource_group_name   = var.resource_group_name
  location              = var.location
  size                  = each.value.vm_size
  admin_username        = var.admin_username
  network_interface_ids = [var.network_interface_ids[each.key]]

  admin_ssh_key {
    username   = var.admin_username
    public_key = file("~/.ssh/id_rsa.pub")
  }

  os_disk {
    name                 = "${each.key}-osdisk"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = var.source_image_reference.publisher
    offer     = var.source_image_reference.offer
    sku       = var.source_image_reference.sku
    version   = var.source_image_reference.version
  }

  tags = var.common_tags
}
