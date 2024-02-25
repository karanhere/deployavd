
resource "azurerm_virtual_desktop_workspace" "workspace" {
  name                = "${terraform.workspace}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  friendly_name = "${terraform.workspace}"
  description   = "Deployed via terraform"
  tags = var.resource_tags
}

// AVD workspace app group association //
resource "azurerm_virtual_desktop_workspace_application_group_association" "ws-dag" {
  workspace_id         = azurerm_virtual_desktop_workspace.workspace.id
  application_group_id = azurerm_virtual_desktop_application_group.dag.id
}

