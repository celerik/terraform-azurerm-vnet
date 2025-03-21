output "id" {
  value = try(azurerm_virtual_network.this.id, null) # if vnet id doesn't exist, return null
}

output "name" {
  value = try(azurerm_virtual_network.this.name, null) # if vnet name doesn't exist, return null
}
