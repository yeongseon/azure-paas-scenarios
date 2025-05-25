variable "prefix" {
  type        = string
  description = "Unique prefix for naming all resources (e.g. your username or environment name)"
}

variable "location" {
  type        = string
  default     = "Korea Central"
  description = "Azure region to deploy resources (e.g., Korea Central, East US, West Europe)."
}

variable "app_sku_tier" {
  type        = string
  default     = "Basic"
  description = "App Service Plan SKU tier (e.g., Free, Basic, Standard)."
}

variable "app_sku_size" {
  type        = string
  default     = "B1"
  description = "App Service Plan SKU size (e.g., F1, B1, S1)."
}
