terraform {
  required_providers {
    azurerm = {
        source = "hashicorp/azurerm"
        version = ">=2.0.0"
    }
  }
  # backend "azurerm" {
  #   resource_group_name = "centralus"
  #   storage_account_name = "dbricks9029"
  #   container_name = "tfbackup"
  #   key = "aks-mslearn.tfstate"
  # }
}

provider "azurerm" {
    features {
      
    }
}
  
