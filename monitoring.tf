# Action Group
resource "azurerm_monitor_action_group" "alert" {
  name                = "vm-alert-action-group"
  resource_group_name = azurerm_resource_group.rg.name
  short_name          = "vmalert"
}

########################
# CPU Alerts
########################
resource "azurerm_monitor_metric_alert" "cpu_alert" {
  for_each = {
    vm1 = azurerm_linux_virtual_machine.shop_vm1.id
    vm2 = azurerm_linux_virtual_machine.shop_vm2.id
  }

  name                = "cpu-alert-${each.key}"
  resource_group_name = azurerm_resource_group.rg.name
  scopes              = [each.value]

  description         = "Alert if CPU > 80%"
  severity            = 3
  frequency           = "PT1M"
  window_size         = "PT5M"

  criteria {
    metric_namespace = "Microsoft.Compute/virtualMachines"
    metric_name      = "Percentage CPU"
    aggregation      = "Average"
    operator         = "GreaterThan"
    threshold        = 80
  }

  action {
    action_group_id = azurerm_monitor_action_group.alert.id
  }
}

########################
# RAM Alerts
########################
resource "azurerm_monitor_metric_alert" "ram_alert" {
  for_each = {
    vm1 = azurerm_linux_virtual_machine.shop_vm1.id
    vm2 = azurerm_linux_virtual_machine.shop_vm2.id
  }

  name                = "ram-alert-${each.key}"
  resource_group_name = azurerm_resource_group.rg.name
  scopes              = [each.value]

  description         = "Alert if Available RAM < 2GB"
  severity            = 3
  frequency           = "PT1M"
  window_size         = "PT5M"

  criteria {
    metric_namespace = "Microsoft.Compute/virtualMachines"
    metric_name      = "Available Memory Bytes"
    aggregation      = "Average"
    operator         = "LessThan"
    threshold        = 2147483648
  }

  action {
    action_group_id = azurerm_monitor_action_group.alert.id
  }
}

