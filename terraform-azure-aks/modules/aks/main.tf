resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_name
  location            = var.mod_rg_location
  resource_group_name = var.mod_rg_name
  dns_prefix = "kelyaks"

  default_node_pool {
    name       = "default"
    vm_size    = "Standard_B2s"
    node_count     = 2
    vnet_subnet_id = var.subnet_id
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin      = "azure"
    load_balancer_sku   = "standard"
    service_cidr        = "10.1.0.0/16"
    dns_service_ip      = "10.1.0.10"
  }
}
