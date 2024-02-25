
data "azurerm_virtual_network" "ad_vnet_data" {
  name                = var.ad_vnet
  resource_group_name = var.ad_rg
}

resource "azurerm_virtual_network_peering" "local_peer" {
  name                      = "${terraform.workspace}-ad"
  resource_group_name       = azurerm_resource_group.rg.name
  virtual_network_name      = azurerm_virtual_network.vnet.name
  remote_virtual_network_id = data.azurerm_virtual_network.ad_vnet_data.id
  depends_on = [ azurerm_subnet.subnet ]
}
resource "azurerm_virtual_network_peering" "ad_peer" {
  name                      = "ad-${terraform.workspace}"
  resource_group_name       = var.ad_rg
  virtual_network_name      = var.ad_vnet
  remote_virtual_network_id = azurerm_virtual_network.vnet.id
  depends_on = [ azurerm_subnet.subnet ]
}




data "azurerm_virtual_network" "vnet-wsapproyovpn" {
  name = var.sap_vnet
  resource_group_name = var.sap_rg
}

resource "azurerm_virtual_network_peering" "local_peer1" {
  name                      = "${terraform.workspace}-sap"
  resource_group_name       = azurerm_resource_group.rg.name
  virtual_network_name      = azurerm_virtual_network.vnet.name
  remote_virtual_network_id = data.azurerm_virtual_network.vnet-wsapproyovpn.id
  allow_virtual_network_access = true
  allow_forwarded_traffic = true
  allow_gateway_transit = true
  use_remote_gateways = true

  depends_on = [ azurerm_subnet.subnet ]
}
resource "azurerm_virtual_network_peering" "sap_peer" {
  name                      = "sap-${terraform.workspace}"
  resource_group_name       = var.sap_rg
  virtual_network_name      = var.sap_vnet
  remote_virtual_network_id = azurerm_virtual_network.vnet.id
  allow_virtual_network_access = true
  allow_forwarded_traffic = true
  allow_gateway_transit = true

  depends_on = [ azurerm_subnet.subnet ]
}