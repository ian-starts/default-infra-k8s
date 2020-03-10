provider "helm" {
  kubernetes {
    config_path = var.kubernetes_config
  }
}

provider "kubernetes" {
  config_path = var.kubernetes_config
}

data "helm_repository" "stable" {
  depends_on = [null_resource.cert_manager_crds]

  name = "stable"
  url = "http://storage.googleapis.com/kubernetes-charts"
}