# Resource Group Info
rg_name  = "myRG"
location = "korea central"

# Network info
vnet_name          = "myVnet"
vnet_address_space = ["10.0.0.0/16"]

# Subnet info
subnet_name             = "mySubnet"
subnet_address_prefixes = ["10.0.1.0/24"]

# NSG info
nsg_name = "myNSG"

# admin info
admin_username  = "your-admin-username"   # 접속 계정명으로 변경
admin_source_ip = "x.x.x.x"               # 본인 공인 IP로 변경 (NSG 접속 허용용)

source_image_reference = {
  publisher = "Canonical"
  offer     = "ubuntu-24_04-lts"
  sku       = "server"
  version   = "latest"
}

# VM info
vm_config = {
  master = {
    vm_name    = "master"
    vm_size    = "Standard_B2als_v2"
    private_ip = "10.0.1.10"
    public_ip  = true
  }

  worker1 = {
    vm_name    = "worker1"
    vm_size    = "Standard_B2as_v2"
    private_ip = "10.0.1.20"
    public_ip  = false
  }

  worker2 = {
    vm_name    = "worker2"
    vm_size    = "Standard_B2as_v2"
    private_ip = "10.0.1.30"
    public_ip  = false
  }
}