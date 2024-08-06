output "id" {
  value = try(azurerm_virtual_network.vnet.id, null) # if vnet id doesn't exist, return null
}

output "name" {
  value = try(azurerm_virtual_network.vnet.name, null) # if vnet name doesn't exist, return null
}
