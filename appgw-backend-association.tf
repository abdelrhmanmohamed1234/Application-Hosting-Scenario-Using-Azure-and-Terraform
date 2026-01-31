resource "azurerm_network_interface_application_gateway_backend_address_pool_association" "shop_vm1_assoc" {
  network_interface_id    = azurerm_network_interface.shop_nic1.id
  ip_configuration_name   = "internal"
  backend_address_pool_id = [
    for pool in azurerm_application_gateway.appgw.backend_address_pool :
    pool.id
    if pool.name == "shop-backend"
  ][0]

  depends_on = [azurerm_application_gateway.appgw]
}

resource "azurerm_network_interface_application_gateway_backend_address_pool_association" "shop_vm2_assoc" {
  network_interface_id    = azurerm_network_interface.shop_nic2.id
  ip_configuration_name   = "internal"
  backend_address_pool_id = [
    for pool in azurerm_application_gateway.appgw.backend_address_pool :
    pool.id
    if pool.name == "shop-backend"
  ][0]

  depends_on = [azurerm_application_gateway.appgw]
}

