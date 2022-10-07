terraform {
  required_version = ">= 1.3.1"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

provider "azurerm" {
  features {

  }
  /*
  alias = "test1"
  subscription_id = var.subscription_id
  client_id = var.client_id
  client_secret = var.client_secret
  */
}

resource "azurerm_resource_group" "example" {
  name = "example-resource-group"
  location = "West Europe"
}
