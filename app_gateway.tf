resource "azurerm_application_gateway" "appgw" {
  name                = "shop-appgw"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  sku {
    name     = "Standard_v2"
    tier     = "Standard_v2"
    capacity = 2
  }

  gateway_ip_configuration {
    name      = "gateway-ip-config"
    subnet_id = azurerm_subnet.appgw_subnet.id
  }

  frontend_ip_configuration {
    name                 = "frontend-ip"
    public_ip_address_id = azurerm_public_ip.appgw_public_ip.id
  }

  frontend_port {
    name = "frontendPort"
    port = 80
  }

  http_listener {
    name                           = "listener"
    frontend_ip_configuration_name = "frontend-ip"
    frontend_port_name             = "frontendPort"
    protocol                       = "Http"
  }

  ##########################
  # REQUIRED routing rule
  ##########################
  request_routing_rule {
    name               = "basic-shop-rule"
    rule_type          = "Basic"
    http_listener_name = "listener"
    backend_address_pool_name  = "shop-backend"
    backend_http_settings_name = "shop-backend-http"
    priority                   = 100   # <-- MUST set a number
  }

  ##########################
  # BACKEND POOLS
  ##########################
  backend_address_pool {
    name = "shop-backend"
  }

  backend_address_pool {
    name = "admin-backend"
  }

  ##########################
  # HTTP SETTINGS
  ##########################
  backend_http_settings {
    name                  = "shop-backend-http"
    port                  = 80
    protocol              = "Http"
    cookie_based_affinity = "Disabled"
    request_timeout       = 30
  }

  backend_http_settings {
    name                  = "admin-backend-http"
    port                  = 80
    protocol              = "Http"
    cookie_based_affinity = "Disabled"
    request_timeout       = 30
  }
}

