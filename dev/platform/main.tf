data "terraform_remote_state" "core" {
  backend = "azurerm"
  config = {
      resource_group_name = "tfstate"
      storage_account_name = "toggletfstate619"
      container_name = "tfstate"
      key = "dev-core.tfstate"
    }
}

module "aks" {
  source             = "../../modules/aks"
  cluster_name       = var.cluster_name
  cluster_dns_prefix = var.cluster_dns_prefix
  resource_group_name = data.terraform_remote_state.core.outputs.resource_group_name
  resource_group_location = data.terraform_remote_state.core.outputs.resource_group_location
  acr_name = data.terraform_remote_state.core.outputs.acr_name
  node_count = var.node_count
}
