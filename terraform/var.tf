variable "source_db" {
  description = "Name of the source PostgreSQL Single Server"
}

variable "target_db" {
  description = "Name of the target PostgreSQL Single Server"
}

variable "source_resource_group" {
  description = "Name of the resource group where the source database resides"
}

variable "location" {
  description = "The Azure Region in which all resources are created."
  default = "UK South"
}

variable "target_resource_group" {
  description = "Name of the target resource group"
}