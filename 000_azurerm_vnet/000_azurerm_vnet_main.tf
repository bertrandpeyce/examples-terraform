
terraform {
  required_version = ">= 1.0.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>4.0"

  }
}
}


provider "azurerm" {
  subscription_id = var.subscription_id
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = format("%s-rg",var.prefix_name)
  location = var.location
}

module "network" {
  source = "../modules/azurerm/network"

  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  prefix_name         = var.prefix_name
  vnet_address_space = var.vnet_address_space
  subnet_address_prefixes = var.subnet_address_prefixes
  vnet_tags = {
    "owner" = "toto@example.com"
    "environment" = "dev"
    "project" = "example-000-azurerm-vnet"
    "repository" = "https://github.com/bertrandpeyce/examples-terraform"
  }
    
}
