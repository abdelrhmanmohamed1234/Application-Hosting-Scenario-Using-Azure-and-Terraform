# Recovery Services Vault
resource "azurerm_recovery_services_vault" "vault" {
  name                = "vm-backup-vault"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  sku                 = "Standard"
}

# Backup Policy for VMs (Weekly)
resource "azurerm_backup_policy_vm" "weekly_policy" {
  name                = "weekly-vm-policy"
  resource_group_name = azurerm_resource_group.rg.name
  recovery_vault_name = azurerm_recovery_services_vault.vault.name
  timezone            = "Egypt Standard Time"

  backup {
    frequency = "Weekly"
    time      = "23:00"
    weekdays  = ["Friday"]
  }

  retention_weekly {
    count    = 4
    weekdays = ["Friday"]
  }
}

# Protect VM1
# resource "azurerm_backup_protected_vm" "shop_vm1_backup" {
#   depends_on = [
#     azurerm_linux_virtual_machine.shop_vm1
#   ]
#
#   resource_group_name = azurerm_resource_group.rg.name
#   recovery_vault_name = azurerm_recovery_services_vault.vault.name
#   source_vm_id        = azurerm_linux_virtual_machine.shop_vm1.id
#   backup_policy_id    = azurerm_backup_policy_vm.weekly_policy.id
# }

# Protect VM2
# resource "azurerm_backup_protected_vm" "shop_vm2_backup" {
#   depends_on = [
#     azurerm_linux_virtual_machine.shop_vm2
#   ]
#
#   resource_group_name = azurerm_resource_group.rg.name
#   recovery_vault_name = azurerm_recovery_services_vault.vault.name
#   source_vm_id        = azurerm_linux_virtual_machine.shop_vm2.id
#   backup_policy_id    = azurerm_backup_policy_vm.weekly_policy.id
# }


