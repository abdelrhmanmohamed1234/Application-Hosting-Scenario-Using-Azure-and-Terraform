resource "azurerm_lb" "shop_ilb" {
  name                = "shop-ilb"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  sku                 = "Standard"

  frontend_ip_configuration {
    name                          = "shop-ilb-ip"
    subnet_id                     = azurerm_subnet.websubnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_lb_backend_address_pool" "shop_backend" {
  name            = "shop-backend-pool"
  loadbalancer_id = azurerm_lb.shop_ilb.id
}

