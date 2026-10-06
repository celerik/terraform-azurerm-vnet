## --------------------------------------
##  LANDING ZONE SUBNETS
## --------------------------------------

resource "azurerm_subnet" "snet" {
  name                 = var.name
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  address_prefixes     = [var.snet_address_range]

  private_endpoint_network_policies = var.private_endpoint_network_policies

  dynamic "service_endpoint" {
    for_each = var.service_endpoints
    content {
      service = service_endpoint.value
    }
  }

  dynamic "delegation" {
    for_each = var.delegation != null ? [var.delegation] : []
    content {
      name = delegation.value.name

      service_delegation {
        name    = delegation.value.service_delegation.name
        actions = delegation.value.service_delegation.actions
      }
    }
  }
}
