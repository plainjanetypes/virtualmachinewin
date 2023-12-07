data "azurerm_virtual_network" "vnet_vm" {
  name = "vnet07" #variable 
  resource_group_name = "centralus" #variable
}

data "azurerm_subnet" "subnet_idvm" {
  name = "default" #variable
  virtual_network_name = "vnet07" #variable
  resource_group_name = "centralus" #variable
}

data "azurerm_resource_group" "rg_vm" {
  name = "centralus" #variable
}

data "azurerm_key_vault" "keyvault_vm" {
    name = "deer35kv" #variable
    resource_group_name = "centralus" #variable
}

data "azurerm_key_vault_secret" "keyvault_pw" {
    name = "vmpassword" #variable
    key_vault_id = "/subscriptions/a87b2fd2-98c1-4751-9689-5bc24a57d50a/resourceGroups/centralus/providers/Microsoft.KeyVault/vaults/deer35kv"
}

locals {
  prefix = "vm07"
  suffix = "xx"
}

