resource "azurerm_kubernetes_cluster" "aks_cluster" {
  name                = var.aks-name
  location            = var.region
  resource_group_name = var.resource_group_name
  dns_prefix          = var.dns_prefix

  default_node_pool {
    name       = "system"
    node_count = 1
    vm_size    = "Standard_D4ds_v5"
    vnet_subnet_id = var.aks_subnet_id
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin = "azure"
    load_balancer_sku = "standard"
  }

  ingress_application_gateway {
    subnet_id = var.application_gateway_subnet_id
  }
}

resource "azurerm_role_assignment" "app_gw_role_assignment"{
  scope = var.application_gateway_subnet_id
  role_definition_name = "Network Contributor"
  principal_id = azurerm_kubernetes_cluster.aks_cluster.ingress_application_gateway[0].ingress_application_gateway_identity[0].object_id
}

resource "azurerm_kubernetes_cluster_node_pool" "user" {
  name = "user"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks_cluster.id
  vm_size = "Standard_D4ds_v5"
  node_count = 1
  vnet_subnet_id = var.aks_subnet_id
}
