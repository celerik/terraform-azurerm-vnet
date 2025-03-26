## --------------------------------------
##  LANDING ZONE SUBNETS
## --------------------------------------

resource "azurerm_subnet" "snet" {
  name                 = var.name
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  address_prefixes     = [var.snet_address_range]

  private_endpoint_network_policies = var.private_endpoint_network_policies
  service_endpoints                 = var.service_endpoints
}
