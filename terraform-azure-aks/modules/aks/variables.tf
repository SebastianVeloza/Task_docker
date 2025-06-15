variable "aks_name" {
  description = "Nombre del clúster AKS"
  type        = string
}

variable "mod_rg_location" {
  type = string
}
variable "mod_rg_name" {
  type = string
}

variable "subnet_id" {
  description = "ID de la subred para el clúster"
  type        = string
}
