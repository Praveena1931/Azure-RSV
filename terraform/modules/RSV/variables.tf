variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
  default = "RSV-rg"
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "East US"
}

variable "recovery_vault_name" {
  description = "Name of the Recovery Services Vault"
  type        = string
  default = "RSV-Vault"
}
