locals {
  domain_password= data.azurerm_key_vault_secret.domainpw.value
  address_space={
    sademo2308="10.8.0.0/16"
    tfdeploy="10.5.0.0/16"
    default="10.4.0.0/16"
  }
}