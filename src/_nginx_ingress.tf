resource "kubernetes_config_map" "nginx_ingress_config_map" {
  metadata {
    name = "nginx-configuration-default"
    namespace = "ingress-nginx"
    labels = {
      app = "ingress-nginx"
    }
  }

  data = {
    whitelist-source-range = var.whitelist_ips
  }
}