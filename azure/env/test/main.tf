# 1. RG
# 2. VPC / Subnet / PIP / NIC
# 3. NSG
# 4. VM 3대 (master, node1, node2)
# 5. PIP

# Create Resource Group 
resource "azurerm_resource_group" "ResourceGroup" {
  name     = var.rg_name
  location = var.location
  tags     = var.common_tags
}


# Create Vnet/Subnet/PIP(master)
module "network" {
  source              = "../modules/network"
  resource_group_name = azurerm_resource_group.ResourceGroup.name
  location            = azurerm_resource_group.ResourceGroup.location

  vnet_name          = var.vnet_name
  vnet_address_space = var.vnet_address_space

  subnet_name             = var.subnet_name
  subnet_address_prefixes = var.subnet_address_prefixes

  # vm network info
  vm_config = var.vm_config

  common_tags = var.common_tags
}

# Create NSG
module "security" {
  source              = "../modules/security"
  nsg_name            = var.nsg_name
  location            = azurerm_resource_group.ResourceGroup.location
  resource_group_name = azurerm_resource_group.ResourceGroup.name

  subnet_id          = module.network.subnet_id
  admin_source_ip    = var.admin_source_ip
  master_pip_address = module.network.master_pip_address

  common_tags = var.common_tags
}


module "vm" {
  source                 = "../modules/vm"
  vm_config              = var.vm_config
  resource_group_name    = var.rg_name
  location               = var.location
  admin_username         = var.admin_username
  network_interface_ids  = module.network.nic_ids
  source_image_reference = var.source_image_reference

  common_tags = var.common_tags
}
