resource "helm_release" "openvpn" {
  depends_on = [
    null_resource.kubernetes_service_account_tiller
  ]
  name = "openvpn"
  namespace = "kube-system"
  repository = "https://raw.githubusercontent.com/ian-starts/openvpn-helm-chart/master"
  chart = "openvpn"
  version = "4.2.5"

  set {
    name = "service.type"
    value = "NodePort"
  }

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
    # Pods network
    name = "openvpn.OVPN_K8S_POD_NETWORK"
    value = "10.42.0.0"
  }

  set {
    name = "openvpn.OVPN_K8S_POD_SUBNET"
    value = "255.255.0.0"
  }

  set {
    # OpenVPN clients network
    name = "openvpn.OVPN_NETWORK"
    value = "10.10.0.0"
  }

  set {
    name = "openvpn.OVPN_SUBNET"
    value = "255.255.0.0"
  }

  set {
    # Kubernetes service network (eg. DNS)
    name = "openvpn.OVPN_K8S_SVC_NETWORK"
    value = "10.43.0.0"
  }

  set {
    name = "openvpn.OVPN_K8S_SVC_SUBNET"
    value = "255.255.0.0"
  }

  set {
    # Enables revoking clients
    name = "openvpn.useCrl"
    value = true
  }

  set {
    # Required to access other networks (Pods, Kubernetes)
    name = "ipForwardInitContainer"
    value = true
  }

  timeout = 600
}