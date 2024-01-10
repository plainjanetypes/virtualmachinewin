module "vm_07_deploy" {
    source = "./module/vm"
    vmname = "vm1"
    rgname = "rg1"
}



module "aks_07_deploy" {
    source = "./module/aks"
  
}