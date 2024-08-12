output "kube_config" {
  value     = azurerm_kubernetes_cluster.aks_cluster.kube_config_raw
  sensitive = true
}

output "aks_endpoint" {
  value = azurerm_kubernetes_cluster.aks_cluster.kube_config.0.host
}

output "aks_certificate" {
  value = base64decode(azurerm_kubernetes_cluster.aks_cluster.kube_config[0].client_certificate)
  sensitive = true
}

output "aks_key" {
  value = base64decode(azurerm_kubernetes_cluster.aks_cluster.kube_config[0].client_key)
  sensitive = true
}

output "aks_cluster_ca_certificate" {
  value = base64decode(azurerm_kubernetes_cluster.aks_cluster.kube_config[0].cluster_ca_certificate)
  sensitive = true
}

output "app_gateway_id" {
  value = azurerm_kubernetes_cluster.aks_cluster.ingress_application_gateway[0].effective_gateway_id
}