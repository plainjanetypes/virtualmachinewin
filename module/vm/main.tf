resource "azurerm_network_interface" "vm07_nic" {
    name = "${local.prefix}-eastus-${local.suffix}-nic"
    resource_group_name = var.rgname #data.azurerm_resource_group.rg_vm.name
    location = data.azurerm_resource_group.rg_vm.location
    ip_configuration {
      name = "internal"
      subnet_id = data.azurerm_subnet.subnet_idvm.id
      private_ip_address_allocation = "Dynamic"
    }
  
}
resource "azurerm_windows_virtual_machine" "vm07_xx" {
    name = var.vmname #"${local.prefix}-eastus-${local.suffix}"
    resource_group_name = var.rgname #data.azurerm_resource_group.rg_vm.name 
    location = data.azurerm_resource_group.rg_vm.location
    size = "Standard_D2s_v3" #add array
    admin_username = "vmadmin"
    admin_password = data.azurerm_key_vault_secret.keyvault_pw.value
    network_interface_ids = [
        azurerm_network_interface.vm07_nic.id
    ]
    os_disk {
      caching = "ReadWrite"
      storage_account_type = "Standard_LRS"
    }
    source_image_reference {
        publisher = "MicrosoftWindowsServer"
        offer     = "WindowsServer"
        sku       = "2016-Datacenter"
        version   = "latest"
    }
  
}