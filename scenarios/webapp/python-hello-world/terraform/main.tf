provider "azurerm" {
  features {}
}

locals {
  timestamp   = formatdate("YYYYMMDDhhmmss", timestamp())
  name_suffix = "${var.prefix}-${local.timestamp}"
}

resource "azurerm_resource_group" "rg" {
  name     = "rg-${local.name_suffix}"
  location = var.location
}

resource "azurerm_app_service_plan" "asp" {
  name                = "asp-${local.name_suffix}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  kind     = "Linux"
  reserved = true

  sku {
    tier = var.app_sku_tier
    size = var.app_sku_size
  }
}

resource "azurerm_app_service" "app" {
  name                = "app-${local.name_suffix}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_app_service_plan.asp.id

  site_config {
    linux_fx_version = "PYTHON|3.9"
  }

  app_settings = {
    "WEBSITE_RUN_FROM_PACKAGE" = "1"
  }
}
