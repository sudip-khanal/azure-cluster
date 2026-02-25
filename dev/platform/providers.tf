terraform {
  required_version = ">=1.0"

  required_providers {
    azapi = {
      source  = "azure/azapi"
      version = "~>2.5.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>4.55.0"
    }
     helm ={
      source = "hashicorp/helm"
      version = "3.1.1"
    }
  }
  backend "azurerm" {
    resource_group_name  = "tfstate"
    storage_account_name = "toggletfstate619"
    container_name       = "tfstate"
    key                  = "plat-core.tfstate"
  }
}

provider "azurerm" {
  features {}

  subscription_id = var.subscription_id
}
