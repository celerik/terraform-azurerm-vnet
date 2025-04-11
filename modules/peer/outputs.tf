
output "id" {
  value = try(azurerm_virtual_network_peering.peer.id, null)
}
