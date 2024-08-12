variable "dify-version" {
  type = string
  default = "0.6.15"
}

variable "dify-custom-domain" {
  type = string
  description = "Custom domain for the Dify application"
}

variable "postgre_host" {
  type = string
  description = "Host of the PostgreSQL server"
}

variable "postgre_user" {
  type = string
  description = "Username for the PostgreSQL server"
}

variable "postgre_password" {
  type = string
  description = "Password for the PostgreSQL server"
}

variable "postgre_db" {
  type = string
  description = "Database name for the PostgreSQL server"
}

variable "redis_host" {
  type = string
  description = "Host of the Redis server"
}

variable "redis_port" {
  type = number
  description = "Port of the Redis server"
  
}

variable "redis_access_key" {
  type = string
  description = "Access key for the Redis server"
  
}

variable "aks_endpoint" {
  type = string
  description = "Host of the Kubernetes cluster"
  
}

variable "aks_certificate" {
  type = string
  description = "Client certificate for the Kubernetes cluster"
  
}

variable "aks_key" {
  type = string
  description = "Client key for the Kubernetes cluster"
  
}

variable "storage_account_name" {
  type = string
  description = "Name of the storage account"
  
}

variable "storage_account_container_name" {
  type = string
  description = "Name of the storage account container"
  
}

variable "storage_account_key" {
  type = string
  description = "Access key for the storage account"
  
}