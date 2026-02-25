resource "helm_release" "argocd" {
  name             = var.argocd_name
  repository       = var.argocd_repository
  chart            = var.argocd_chart
  version          = var.argocd_version
  namespace        = var.argocd_namespace
  create_namespace = true

  depends_on = [
    azurerm_kubernetes_cluster.k8s
  ]

  values = [
    yamlencode({
      configs = {
        params = {
          "server.insecure" = "true" # argo-cd.readthedocs.io/en/latest/operator-manual/ingress/
        }
      }
    })
  ]
}
