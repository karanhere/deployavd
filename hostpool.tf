
resource "azurerm_virtual_desktop_host_pool" "terrahostpool" {
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  name                     = "${terraform.workspace}"
  friendly_name            = "${terraform.workspace}"
  validate_environment     = false
  start_vm_on_connect      = true
  custom_rdp_properties    = "audiocapturemode:i:1;audiomode:i:0;drivestoredirect:s:*;redirectclipboard:i:1"
  description              = "testing env"
  type                     = "Pooled"
  maximum_sessions_allowed = 6
  load_balancer_type       = "BreadthFirst"
  /*scheduled_agent_updates {
    enabled = true
    schedule {
      day_of_week = "Saturday"
      hour_of_day = 2
    }
  }
  */
  tags = var.resource_tags
}

resource "azurerm_virtual_desktop_host_pool_registration_info" "registrationinfo" {
  hostpool_id     = azurerm_virtual_desktop_host_pool.terrahostpool.id
  expiration_date = var.rfc3339
}
