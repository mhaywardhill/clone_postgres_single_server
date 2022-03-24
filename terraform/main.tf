provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "main" {
  name     = var.target_resource_group
  location = var.location
}

data "azurerm_postgresql_server" "source" {
  name                = var.source_db
  resource_group_name = var.source_resource_group
} 

resource "azurerm_postgresql_server" "clone" {
  name                = var.target_db
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  create_mode 			= "PointInTimeRestore"
  creation_source_server_id 	= data.azurerm_postgresql_server.source.id 
  restore_point_in_time 	= "2022-03-24T16:00:38.000Z"

  ssl_enforcement_enabled = true
  version 			  = "11"
  sku_name 			  = "GP_Gen5_2"

  public_network_access_enabled    = false
}




