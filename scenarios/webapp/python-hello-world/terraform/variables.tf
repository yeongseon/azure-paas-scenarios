variable "resource_group_name" {
  type        = string
  description = "Name of the resource group to create."
}

variable "location" {
  type        = string
  default     = "East US"
  description = "Azure region to deploy resources."
}

variable "app_service_plan_name" {
  type        = string
  description = "Name of the App Service Plan."
}

variable "app_name" {
  type        = string
  description = "Base name of the App Service app."
}

variable "app_sku_tier" {
  type        = string
  default     = "Basic"
  description = "App Service Plan SKU tier."
}

variable "app_sku_size" {
  type        = string
  default     = "B1"
  description = "App Service Plan SKU size."
}
