variable "psql-flexible" {
  type = string
  description = "Name of the PostgreSQL Flexible Server"
  
}

variable "pgsql-user" {
  type = string
  description = "Username for the PostgreSQL Flexible Server"
}

variable "pgsql-password" {
  type = string
  description = "Password for the PostgreSQL Flexible Server"
}

variable "redis_name" {
  type = string
  description = "Name of the Redis Cache"
  
}

variable "resource_group_name" {
  type = string
  description = "Name of the resource group in which the resources should be created"
  
}

variable "region" {
  type = string
  description = "Region in which the resources should be created"
}

variable "virtual_network_id" {
  type = string
  description = "ID of the virtual network"
}

variable "postgre_subnet_id" {
  type = string
  description = "ID of the subnet for the PostgreSQL Flexible Server"
}

variable "privatelink_subnet_id" {
  type = string
  description = "ID of the subnet for the private link"
  
}

variable "storage_account_name" {
  type = string
  description = "Name of the storage account"
  
}

variable "storage_account_container_name" {
  type = string
  description = "Name of the storage account container"
  
}