variable "location" {
  description = "Region in which to create resources"
  type        = string
}

variable "resource_group_name" {
  type = string
}

variable "vm_config" {
  type = map(object({
    vm_name = string
    vm_size = string
  }))
}

variable "network_interface_ids" {
  type = map(string)
}

variable "admin_username" {
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
}

