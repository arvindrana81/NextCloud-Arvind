provider "azurerm" {
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
  #version = "~>2.0"
  features {}
}

variable "subscription_id" {
  description = "Enter subscription ID for provisioning resources in Azure"
}

variable "client_id" {
  description = "enter client ID"
}

variable "client_secret" {
  description = "Enter client secret"
}

variable "tenant_id" {
  description = "entern tenant ID for Azure AD"
}