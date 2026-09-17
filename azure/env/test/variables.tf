variable "location" {
  type = string
}

variable "rg_name" {
  type = string
}

variable "vnet_name" {
  type = string
}

variable "vnet_address_space" {
  type = list(string)
}

variable "subnet_name" {
  type = string
}

variable "subnet_address_prefixes" {
  type = list(string)
}


variable "nsg_name" {
  type = string
}


variable "vm_config" {
  type = map(object({
    vm_name    = string
    vm_size    = string
    private_ip = string
    public_ip  = bool
  }))
}

variable "admin_username" {
  type = string
}

variable "admin_source_ip" {
  type = string
}

variable "source_image_reference" {
  type = object({
    publisher = string
    offer     = string
    sku       = string
    version   = string
  })
}


variable "common_tags" {
  type = map(string)
  default = {
    env        = "test"
    managed_by = "terraform"
  }
}
