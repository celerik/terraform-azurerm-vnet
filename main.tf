## --------------------------------------
##  LOCAL VARIABLES
## --------------------------------------

locals {
  tags = var.tags
}

## --------------------------------------
##  VIRTUAL NETWORK
## --------------------------------------

resource "azurerm_virtual_network" "this" {
  name                = var.name
  address_space       = [var.vnet_address_space]
  location            = var.location
  resource_group_name = var.resource_group_name

  dns_servers = var.dns_servers

  tags = local.tags
}
