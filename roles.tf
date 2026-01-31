# roles.tf

# Enable / Disable AD groups creation
# variable "enable_ad_groups" { default = true }

resource "azuread_group" "network_admin" {
  count            = var.enable_ad_groups ? 1 : 0
  display_name     = "Network Admin"
  security_enabled = true
  mail_enabled     = false
  description      = "Group for network administrators"
}

resource "azuread_group" "cloud_admin" {
  count            = var.enable_ad_groups ? 1 : 0
  display_name     = "Cloud Admin"
  security_enabled = true
  mail_enabled     = false
  description      = "Group for cloud administrators"
}

resource "azuread_group" "reader" {
  count            = var.enable_ad_groups ? 1 : 0
  display_name     = "Reader"
  security_enabled = true
  mail_enabled     = false
  description      = "Group with read-only access"
}

