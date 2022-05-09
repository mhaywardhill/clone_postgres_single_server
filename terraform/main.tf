terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.1"
    }
  }
}

provider "azurerm" {
  features {}
}

data "azurerm_postgresql_server" "source" {
  name                = var.source_db
  resource_group_name = var.source_resource_group
} 

resource "azurerm_postgresql_server" "clone" {
  name                = var.target_db
  location            = var.location
  resource_group_name = "policy-clone"

  create_mode 			= "PointInTimeRestore"
  creation_source_server_id 	= data.azurerm_postgresql_server.source.id 
  restore_point_in_time 	= var.restore_point_in_time

  ssl_enforcement_enabled = true
  version 			  = data.azurerm_postgresql_server.source.version
  sku_name 			  = data.azurerm_postgresql_server.source.sku_name
  
  public_network_access_enabled = false

}




