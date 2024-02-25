
resource "azurerm_resource_group" "rg" {
  name     = terraform.workspace
  location = var.deploy_location
  tags = var.resource_tags
}
/*
// Data block for resource group used for SA env as resource group and strg ac created outside of tf //
data "azurerm_resource_group" "datarg" {
  name = "existing"
}

output "id" {
  value = data.azurerm_resource_group.datarg.id
}

*/