terraform {
  
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.66.0"
    }
  
}

//backend configuration accessed from backend.conf during runtime//
backend "azurerm" {}
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
