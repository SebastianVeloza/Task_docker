terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.7.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "f0550323-fb0b-44d4-8a39-ecf0f6c2dbc9"
}

module "mod_resource_group" {
  source = "./modules/resource_group"
}

module "mod_security_group" {
  source          = "./modules/network_security_group"
  mod_rg_name     = module.mod_resource_group.out_rg_name
  mod_rg_location = module.mod_resource_group.out_rg_location
}

module "mod_virtual_network" {
  source          = "./modules/virtual_network"
  mod_rg_name     = module.mod_resource_group.out_rg_name
  mod_rg_location = module.mod_resource_group.out_rg_location
  vnet_name       = "vnet1-celula-01"
  address         = ["10.0.0.0/16"]
}


module "mod_subnet" {
  source         = "./modules/subnet"
  mod_rg_name    = module.mod_resource_group.out_rg_name
  mod_vnet_name  = module.mod_virtual_network.out_vnet_name
  mod_nsg_id     = module.mod_security_group.out_nsg_id
  snet_name      = "snet.celula-01"
  address_prefix = ["10.0.1.0/24"]
}


module "mod_network_interface" {
  source = "./modules/network_interface"

  nic_name              = "nic-celula-01-hub"
  mod_rg_location       = module.mod_resource_group.out_rg_location
  mod_rg_name           = module.mod_resource_group.out_rg_name
  ip_config_name        = "hub-ip-config"
  subnet_id             = module.mod_subnet.out_subnet_id
  private_ip_allocation = "Dynamic"

  tags = {
    environment = "dev"
  }
}

module "mod_aks" {
  source          = "./modules/aks"
  aks_name        = "aks-actividad3-01"
  mod_rg_name     = module.mod_resource_group.out_rg_name
  mod_rg_location = module.mod_resource_group.out_rg_location
  subnet_id       = module.mod_subnet.out_subnet_id
}
