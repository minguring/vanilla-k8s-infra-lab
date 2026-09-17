variable "nsg_name" {
  type = string
}

variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "admin_source_ip" {
  type = string
}

variable "master_pip_address" {
  type = string
}

variable "common_tags" {
  type = map(string)
}
