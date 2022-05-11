terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "=3.0.1"
    }
  }
}

module aks-cluster{
    source = "../../../modules/aks/cluster"
    
}