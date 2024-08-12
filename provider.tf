terraform {
  required_version = ">= 0.12"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.109.0"
    }
    azapi = {
      source = "azure/azapi"
    }
    helm = {
      source = "hashicorp/helm"
    }
  }


}

# Configure the Microsoft Azure Provider
provider "azurerm" {

  subscription_id = var.subscription-id
  features {}
}

provider "azapi" {
}

provider "helm" {
  
}