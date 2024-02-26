terraform {
  
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.66.0"
    }
  
}

//backend configuration//
backend "azurerm" {
    resource_group_name  = var.backend_rg
    storage_account_name = var.backend_storage
    container_name       = var.backend_container_name
    key                  = var.backend_key
  }
}

provider "azurerm" {
  # Configuration options
    subscription_id = var.subscription_id
    tenant_id = var.tenant_id
    client_id = var.client_id
    client_secret = var.client_secret
    features {}
  
  
}



provider "azuread" {
  # Configuration options
    tenant_id = var.tenant_id
    client_id = var.client_id
    client_secret = var.client_secret
    
}
