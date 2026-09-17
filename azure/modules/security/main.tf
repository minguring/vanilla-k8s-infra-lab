resource "azurerm_network_security_group" "NSG" {
  name                = var.nsg_name
  location            = var.location
  resource_group_name = var.resource_group_name

  security_rule {
    name                       = "allowSSH"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = var.admin_source_ip
    destination_address_prefix = "*"
  }

  tags = var.common_tags
}


resource "azurerm_subnet_network_security_group_association" "NSG_Subnet_association" {
  subnet_id                 = var.subnet_id
  network_security_group_id = azurerm_network_security_group.NSG.id
}
