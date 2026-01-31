# Admin App Service Plan (Linux – Basic Tier)
# resource "azurerm_service_plan" "admin" {
#   name                = "admin-service-plan"
#   location            = var.location
#   resource_group_name = azurerm_resource_group.rg.name
#
#   os_type  = "Linux"
#   sku_name = "B1"
# }

# Admin Linux Web App
# resource "azurerm_linux_web_app" "admin" {
#   name                = "admin-webapp"
#   location            = var.location
#   resource_group_name = azurerm_resource_group.rg.name
#   service_plan_id     = azurerm_service_plan.admin.id
#
#   site_config {
#     always_on = true
#   }
# }



