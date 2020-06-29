provider "helm" {
  kubernetes {
    config_path = var.kubernetes_config
  }
}

provider "kubernetes" {
  config_path = var.kubernetes_config
}
