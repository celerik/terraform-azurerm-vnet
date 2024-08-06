
output "id" {
  value = try(azurerm_subnet.snet.id, null)
}
