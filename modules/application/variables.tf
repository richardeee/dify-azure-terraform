variable "aks-name" {
   type = string
   description = "Name of the AKS cluster"
}

variable "region" {
   type = string
   description = "Region in which the AKS cluster should be created"
}

variable "dns_prefix" {
   type = string
   description = "DNS prefix for the AKS cluster"
}

variable "resource_group_name" {
   type = string
   description = "Name of the resource group in which the AKS cluster should be created"
}

variable "aks_subnet_id" {
   type = string
   description = "ID of the subnet for the AKS cluster"
  
}

variable "application_gateway_subnet_id" {
   type = string
   description = "ID of the subnet for the Application Gateway"
}