provider "helm" {
  kubernetes {
    host                   = var.kube_config.host
    username               = var.kube_config.username
    password               = var.kube_config.password
    client_certificate     = base64decode(var.kube_config.client_certificate)
    client_key             = base64decode(var.kube_config.client_key)
    cluster_ca_certificate = base64decode(var.kube_config.cluster_ca_certificate)
  }
}