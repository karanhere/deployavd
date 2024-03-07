#data "azuread_client_config" "current" {}
/*
data "azuread_user" "aad_user" {
  for_each            = toset(azuread_group.aad_group.members)
  user_principal_name = format("%s", each.key)
}

data "azuread_users" "name" {
  count = 5
  user_principal_names = ["train${count.index}@${locals.domain}"]
}

*/
data "azurerm_role_definition" "role" { # access an existing built-in role
  name = "Desktop Virtualization User"
}

data "azuread_group" "aad_group" {
  display_name     = var.aad_group_name
  security_enabled = true
  #owners = [data.azuread_client_config.current.object_id] >> use only for resource block
}

output "azureADgroupID" {
  value = data.azuread_group.aad_group.object_id
}
resource "azurerm_role_assignment" "role" {
  scope              = azurerm_virtual_desktop_application_group.dag.id
  role_definition_id = data.azurerm_role_definition.role.id
  principal_id       = data.azuread_group.aad_group.object_id
  depends_on = [ azurerm_virtual_desktop_application_group.dag, 
  data.azurerm_role_definition.role, 
  data.azuread_group.aad_group]
  timeouts {
    create = "5m"
  }
}

output "principaltype" {
value= azurerm_role_assignment.role.principal_type  
}
