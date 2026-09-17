output "subnet_id" {
  value = azurerm_subnet.Subnet.id
}

output "master_pip_address" {
  value = azurerm_public_ip.Pip["master"].ip_address
}

output "nic_ids" {
  value = {
    for key, nic in azurerm_network_interface.Nic :
    key => nic.id
  }
}
