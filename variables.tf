//provider vars //

variable "subscription_id" {
  type = string
  sensitive   = true
  default = null
}

variable "tenant_id" {
  type = string
  sensitive   = true
  default = null
}

variable "client_id" {
  type = string
  sensitive   = true
  default = null
}

variable "client_secret" {
  type = string
  sensitive   = true
  default = null
}

variable "workspace" {
type        = string
description = "name of terraform workspace and environment"
}

variable "rg_location" {
  type        = string
  default     = "centralus"
  description = "Location of the resource group."
  }

variable "rg_name" {
  type        = string
  default     = "TrainingRG"
  description = "Name of the Resource group in which to deploy service objects"
    }

variable "workspace" {
  type        = string
  description = "Name of the Azure Virtual Desktop workspace"
  default     = "Training-Workspace"
    }

variable "hostpool" {
  type        = string
  description = "Name of the Azure Virtual Desktop host pool"
  default     = "TrainingHP"
    }

variable "rfc3339" {
  type        = string
    #default     = "2023-02-17T12:43:13Z"
  description = "Registration token expiration"
    }

variable "rdsh_count" {
  description = "Number of AVD machines to deploy"
  default     = 1
    }

variable "prefix" {
  type        = string
  default     = "Train"
  description = "Prefix of the name of the AVD machine(s)"
    }
variable "domain_name" {
  type        = string
  default     = "worksoft.com"
  description = "Name of the domain to join"
}

variable "domain_user_upn" {
  type        = string
  # do not include domain name as this is appended
  description = "Username for domain join (do not include domain name as this is appended)"
  sensitive = true
}
 /*Using locals.tf as it allows dynamic values
variable "domain_password" {
  type        = string
  description = "Password of the user to authenticate with the domain"
  sensitive   = true
}
*/

variable "vm_size" {
  type = string
  description = "Size of the machine to deploy"
  #default     = "Standard_B4ms"
  default     = "Standard_D8s_v3"
}

variable "ou_path" {
  type = string
  description = "OU path in AD"
}


variable "local_admin_username" {
  type        = string
  description = "local admin username"
}

/* from key vault
variable "local_admin_password" {
  type        = string
  description = "local admin password"
  sensitive   = true
}

variable "avd_users" {
  description = "AVD users"
  default = [
    "train23@worksoft.com",
    "train24@worksoft.com"
  ]
}
*/

variable "aad_group_name" {
  type        = string
  description = "Azure Active Directory Group for AVD users"
}

/*variable "rg_shared_name" {
  type        = string
  description = "Name of the Resource group in which to deploy shared resources"
}*/

variable "deploy_location" {
  type        = string
  default     = "centralus"
  description = "The Azure Region in which all resources in this example should be created."
}

variable "ad_rg" {
  type        = string
  default     = "Worksoft"
  description = "Name of domain controller resource group"
}
variable "ad_vnet" {
  type        = string
  default     = "aadds-vnet"
  description = "Name of domain controller vnet"
}

variable "dns_servers" {
  type        = list(string)
  default     = ["10.0.2.4", "10.0.2.5"]
  description = "Custom DNS configuration"
}
/*
variable "vnet_range" {
  type        = list(string)
  #default     = ["10.7.0.0/16"]
  description = "Address range for deployment VNet"
}

variable "subnet_range" {
  type        = list(string)
  #default     = ["10.7.0.0/24"]
  description = "Address range for session host subnet"
}*/
variable "resource_tags" {
  type = map(string)
  description = "Resource Tags in Azure"
  default={
    Team = "CloudOps"
    #Partner = "SA-Training"
    Deployment = "Terraform"
    #Env = "Dev"
    }
}

variable "imageversion_name" {
  type = string
  default = "12.1.2306"
}

variable "sap_vnet" {
  type = string
}

variable "sap_rg" {
  type = string
}
