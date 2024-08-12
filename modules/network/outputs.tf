output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "virtual_network_id" {
  value = azurerm_virtual_network.vnet.id
}

output "postgre_subnet_id" {
  value = azurerm_subnet.postgressubnet.id
}

output "privatelink_subnet_id" {
  value = azurerm_subnet.privatelinksubnet.id
}

output "aks_subnet_id" {
  value = azurerm_subnet.akssubnet.id
}

output "application_gateway_subnet_id" {
  value = azurerm_subnet.application_gateway_subnet.id
}