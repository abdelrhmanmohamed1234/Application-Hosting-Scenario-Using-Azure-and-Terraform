# VM1
resource "azurerm_linux_virtual_machine" "shop_vm1" {
  name                  = "shop-vm1"
  resource_group_name   = azurerm_resource_group.rg.name
  location              = var.location
  size                  = "Standard_D2s_v3"

  admin_username = "adminuser"
  admin_password = "Password123!"
  disable_password_authentication = false

  network_interface_ids = [
    azurerm_network_interface.shop_nic1.id
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}

# VM2
resource "azurerm_linux_virtual_machine" "shop_vm2" {
  name                  = "shop-vm2"
  resource_group_name   = azurerm_resource_group.rg.name
  location              = var.location
  size                  = "Standard_D2s_v3"

  admin_username = "adminuser"
  admin_password = "Password123!"
  disable_password_authentication = false

  network_interface_ids = [
    azurerm_network_interface.shop_nic2.id
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}

