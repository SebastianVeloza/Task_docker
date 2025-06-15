variable "vnet_name" {
  type    = string
  default = "vnt-aks-1"
}

variable "address" {
  description = "Nombre del Virtual Network"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

#Variables de resource group
variable "mod_rg_name" {
  type = string
}

variable "mod_rg_location" {
  type = string
}