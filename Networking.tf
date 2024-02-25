resource "azurerm_virtual_network" "vnet" {
  name                = "${terraform.workspace}-VNet"
  address_space       = [local.address_space[terraform.workspace]]
  dns_servers         = var.dns_servers
  location            = var.deploy_location
  resource_group_name = azurerm_resource_group.rg.name
  depends_on          = [azurerm_resource_group.rg]
  tags = var.resource_tags
}




resource "azurerm_subnet" "subnet" {
  name                 = "default"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [cidrsubnet(local.address_space[terraform.workspace],8,1)]
  depends_on           = [azurerm_resource_group.rg]
  service_endpoints = ["Microsoft.Storage"]

}

resource "azurerm_network_security_group" "nsg" {
  name                = "${terraform.workspace}-NSG"
  location            = var.deploy_location
  resource_group_name = azurerm_resource_group.rg.name
  security_rule {
    name                       = "HTTPS"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "443"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  depends_on = [azurerm_resource_group.rg]
}

resource "azurerm_subnet_network_security_group_association" "nsg_assoc" {
  subnet_id                 = azurerm_subnet.subnet.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}






