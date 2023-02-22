resource "azurerm_service_plan" "service_plan" {
    create              = var.windows_web_app.create ? 1 : 0
    name                = var.windows_web_app.name
    resource_group_name = var.windows_web_app.rsg_name
    location            = var.windows_web_app.location
    sku_name            = var.windows_web_app.sku_name
    os_type             = "Windows"
}

resource "azurerm_windows_web_app" "web_app" {
  name                = "example"
  resource_group_name = azurerm_resource_group.service_plan.name
  location            = azurerm_service_plan.service_plan.location
  service_plan_id     = azurerm_service_plan.service_plan.id

  site_config {}
}