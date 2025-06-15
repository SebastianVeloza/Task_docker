variable "nic_name" {
  type = string
}

variable "mod_rg_name" {
  type = string
}

variable "mod_rg_location" {
  type = string
}

variable "ip_config_name" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "private_ip_allocation" {
  type    = string
  default = "Dynamic"
}

variable "public_ip_address_id" {
  type    = string
  default = null

}

variable "tags" {
  type    = map(string)
  default = {}
}
