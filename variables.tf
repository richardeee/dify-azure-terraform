variable "subscription-id" {
  type = string
}

variable "prefix" {
  type = string
}
#virtual network variables
variable "region" {
  type = string
}

variable "ip-prefix" {
  type = string
}
#end virtual network variables

variable "redis_name" {
  type = string
}

variable "psql-flexible" {
  type = string
}

variable "pgsql-user" {
  type = string
  default = "user"
}

variable "pgsql-password" {
  type = string
}

variable "aks-name" {
  type = string
}

variable "dns_prefix" {
  type = string
}

variable "dify-version" {
  type = string
  default = "0.6.15"
}


variable "dify-custom-domain" {
  type = string
}

variable "storage_account_name" {
  type = string
  
}

variable "storage_account_container_name" {
  type = string
  
}