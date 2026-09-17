resource "azurerm_virtual_network" "Vnet" {
  name                = var.vnet_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.vnet_address_space

  tags = var.common_tags
}


resource "azurerm_subnet" "Subnet" {
  name                 = var.subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.Vnet.name
  address_prefixes     = var.subnet_address_prefixes
}


resource "azurerm_network_interface" "Nic" {
  for_each = var.vm_config

  name                = "${each.key}-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "${each.key}-ipconfig"
    subnet_id                     = azurerm_subnet.Subnet.id
    private_ip_address_allocation = "Static"
    private_ip_address            = each.value.private_ip

    public_ip_address_id = each.value.public_ip ? azurerm_public_ip.Pip[each.key].id : null
  }

  tags = var.common_tags
}

resource "azurerm_public_ip" "Pip" {
  for_each = {
    for key, vm in var.vm_config :
    key => vm
    if vm.public_ip
  }
  name                = "${each.key}-pip"
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method   = "Static"

  tags = merge(var.common_tags, { role = "master" })

}
