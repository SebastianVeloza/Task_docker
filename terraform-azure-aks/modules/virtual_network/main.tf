resource "azurerm_virtual_network" "az-vn" {
  name                = var.vnet_name
  location            = var.mod_rg_location
  resource_group_name = var.mod_rg_name
  address_space       = var.address
}
