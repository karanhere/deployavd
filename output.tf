output "print" {
  value = terraform.workspace
}

output "vnet_id" {
  value = azurerm_virtual_network.vnet.id
}