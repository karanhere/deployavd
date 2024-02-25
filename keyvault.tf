data "azurerm_key_vault" "worksoft" {
  name                = "worksoft"
  resource_group_name = "Worksoft"
}

data "azurerm_key_vault_secret" "localadminpw" {
  name         = "localadminpw"
  key_vault_id = data.azurerm_key_vault.worksoft.id
}

data "azurerm_key_vault_secret" "domainpw" {
  name         = "terrapw"
  key_vault_id = data.azurerm_key_vault.worksoft.id
}
