resource "helm_release" "redis" {
  depends_on = [
    null_resource.kubernetes_service_account_tiller,
    null_resource.redis_namespace,
    null_resource.hetnzer_csi_driver
  ]
  name       = "redis"
  namespace  = "redis"
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "redis"

  set {
    name  = "master.persistence.storageClass"
    value = "hcloud-volumes"
  }


  set {
    name  = "cluster.enabled"
    value = "false"
  }


  set {
    name  = "master.persistence.size"
    value = "10Gi"
    # Minimum size for a hetzner volume
  }

  set {
    name  = "usePassword"
    value = "false"
    # Minimum size for a hetzner volume
  } 
 

  set {
    name  = "replica.replicaCount"
    value = "0"
    # Minimum size for a hetzner volume
  }


  timeout = 600
}
