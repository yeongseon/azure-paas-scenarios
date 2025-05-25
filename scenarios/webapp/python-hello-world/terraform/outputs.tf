output "app_name" {
  description = "The name of the deployed App Service"
  value       = azurerm_app_service.app.name
}

output "resource_group_name" {
  description = "The name of the deployed resource group"
  value       = azurerm_resource_group.rg.name
}

output "app_url" {
  description = "The URL of the deployed App Service"
  value       = "https://${azurerm_app_service.app.default_site_hostname}"
}
