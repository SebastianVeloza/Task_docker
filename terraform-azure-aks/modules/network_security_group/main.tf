resource "azurerm_network_security_group" "az-nsg" {
  name                = var.nsg_name
  location            = var.mod_rg_location
  resource_group_name = var.mod_rg_name
  security_rule {
    name                       = "Port_80"
    priority                   = 300
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}