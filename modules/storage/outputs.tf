output postgre_hostname {
  value = azurerm_postgresql_flexible_server.postgres.fqdn
}

output postgre_user {
  value = azurerm_postgresql_flexible_server.postgres.administrator_login
}

output postgre_password {
  value = azurerm_postgresql_flexible_server.postgres.administrator_password
  sensitive = true
}

output postgre_db{
    value = azurerm_postgresql_flexible_server_database.difypgsqldb.name
}

output "redis_cache_hostname" {
  value = join(".", [azurerm_redis_cache.redis.name, azurerm_private_dns_zone.redis.name])
}

output "redis_cache_port" {
  value = azurerm_redis_cache.redis.port
}

output "redis_cache_key" {
  value = azurerm_redis_cache.redis.primary_access_key
  sensitive = true
}

output "storage_account_name" {
  value = azurerm_storage_account.storage_account.name
}

output "storage_account_key" {
  value = azurerm_storage_account.storage_account.primary_access_key
  sensitive = true
}

output "storage_account_container_name" {
  value = azurerm_storage_container.storage_container.name
}
