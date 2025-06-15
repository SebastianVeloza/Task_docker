variable "nsg_name" {
  description = "Nombre del Network Security Group"
  type        = string
  default     = "nsg-aks"
}

#Variables de resource group
variable "mod_rg_name" {
  type = string
}

variable "mod_rg_location" {
  type = string
}
