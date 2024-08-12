variable "prefix" {
  type = string
  description = "Prefix to be used for naming resources"
}

variable "region" {
  type = string
  description = "Region in which the resources should be created"
}

variable "ip-prefix" {
  type = string
  description = "IP prefix for the virtual network"
}