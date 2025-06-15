resource "azurerm_subnet" "az-snet" {
  name                 = var.snet_name
  resource_group_name  = var.mod_rg_name
  address_prefixes     = var.address_prefix
  virtual_network_name = var.mod_vnet_name
}
resource "azurerm_subnet_network_security_group_association" "az-snet-asso" {
  subnet_id                 = azurerm_subnet.az-snet.id
  network_security_group_id = var.mod_nsg_id
}
