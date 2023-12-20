resource "azurerm_kubernetes_cluster" "aks07-ks" {
  name = "${local.prefix}-aks-${local.suffix}" #variable
  location = "eastus" #variable
  resource_group_name = data.azurerm_resource_group.rg_vm.name
  dns_prefix = "${local.prefix}-dnsz-${local.suffix}" #variable
  default_node_pool {
    name = "default"
    node_count = 1
    vm_size = "Standard_D2s_v3" #variable choice
  }
  identity {
    type = "SystemAssigned"
  }
}