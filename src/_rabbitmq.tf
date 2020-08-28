resource "helm_release" "rabbitmq" {
  depends_on = [
    null_resource.kubernetes_service_account_tiller,
    null_resource.rabbitmq_namespace
  ]
  name = "rabbitmq"
  namespace = "rabbit"
  repository = "https://charts.bitnami.com/bitnami"
  chart = "rabbitmq"

  set {
    name = "persistence.storageClass"
    value = "hcloud-volumes"
  }

  set {
    name = "persistence.size"
    value = "10Gi"
    # Minimum size for a hetzner volume
  }

  set {
    name = "auth.username"
    value = "application"
    # Minimum size for a hetzner volume
  }

  set {
    name = "auth.password"
    value = "secret"
    # Minimum size for a hetzner volume
  }
  set {
    name = "plugins"
    value = "rabbitmq_management rabbitmq_shovel rabbitmq_shovel_management"
    # Minimum size for a hetzner volume
  }

  timeout = 600
}