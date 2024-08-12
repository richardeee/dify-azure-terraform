output "aks_host" {
    value = module.application.aks_endpoint
    sensitive = true
}

output "app_gateway_id" {
    value = module.application.app_gateway_id
}