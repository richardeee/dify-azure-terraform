

resource "azurerm_resource_group" "rg" {
  name     = "${var.prefix}-rg-${var.region}"
  location = var.region
}

resource "azurerm_virtual_network" "vnet" {
  name                = "${var.prefix}-vnet-${var.region}"
  address_space       = ["${var.ip-prefix}.0.0/16"]
  location            = var.region
  resource_group_name = azurerm_resource_group.rg.name
}


resource "azurerm_subnet" "privatelinksubnet" {
  name                 = "PrivateLinkSubnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["${var.ip-prefix}.1.0/24"]
}

resource "azurerm_subnet" "akssubnet" {
  name                 = "AKSSubnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["${var.ip-prefix}.16.0/20"]

}

resource "azurerm_subnet" "postgressubnet" {
  name                 = "PostgresSubnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["${var.ip-prefix}.2.0/24"]
  service_endpoints    = ["Microsoft.Storage"]
  delegation {
    name = "postgres-delegation"

    service_delegation {
      name = "Microsoft.DBforPostgreSQL/flexibleServers"
      actions = [
        "Microsoft.Network/virtualNetworks/subnets/join/action",
      ]
    }
  }

}

resource "azurerm_subnet" "application_gateway_subnet" {
  name                 = "ApplicationGatewaySubnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["${var.ip-prefix}.3.0/24"]
}


