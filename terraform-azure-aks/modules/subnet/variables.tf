variable "snet_name" {
  type    = string
  default = "snet-1"
}

variable "mod_vnet_name" {
  type = string
}


variable "mod_rg_name" {
  type = string
}

variable "mod_nsg_id" {
  type = string
}

variable "address_prefix" {
  type = list(string)
}