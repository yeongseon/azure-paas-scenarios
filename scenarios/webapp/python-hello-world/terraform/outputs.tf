output "app_name" {
  description = "The deployed App Service name"
  value       = azurerm_app_service.app.name
}

output "resource_group_name" {
  description = "The name of the created Resource Group"
  value       = azurerm_resource_group.rg.name
}

output "app_url" {
  description = "The publicly accessible URL of the App Service"
  value       = "https://${azurerm_app_service.app.default_site_hostname}"
}
