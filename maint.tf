terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.46.0, >= 3.11.0, >= 3.27.0, < 4.0.0"
    }
  }

 backend "azurerm" {
    resource_group_name  = "Terraform"
    storage_account_name = "terraform4storage"
    container_name       = "tfstatefile"
     key                 = "dev.Terraform.tfstatefile"
    
}
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
  # subscription_id = var.subscription_id
  # client_id       = var.client_id
  # client_secret   = var.client_secret
  # tenant_id       = var.tenant_id
}
module "aks_example_named_cluster" {
  source  = "Azure/aks/azurerm//examples/named_cluster"
  version = "6.2.0"
}