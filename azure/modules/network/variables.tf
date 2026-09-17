variable "location" {
  description = "Region in which to create resources"
  type        = string
}

variable "resource_group_name" {
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

variable "common_tags" {
  type = map(string)
}

variable "vm_config" {
  type = map(object({
    vm_name    = string
    vm_size    = string
    private_ip = string
    public_ip  = bool
  }))
}

