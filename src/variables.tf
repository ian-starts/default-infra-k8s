variable "kubernetes_config" {
  default = "./../.kubeconfig"
}

variable "kubernetes_hetzner_csi_yaml" {
  default = "https://raw.githubusercontent.com/hetznercloud/csi-driver/v1.2.2/deploy/kubernetes/hcloud-csi.yml"
}

variable "hetzner_token" {}

variable "kubernetes_cert_manager_crds_yaml" {
  default = "https://raw.githubusercontent.com/jetstack/cert-manager/release-0.12/deploy/manifests/00-crds.yaml"
}

variable "project_name" {}

variable "docker_hub_username" {}

variable "docker_hub_password" {}

variable "whitelist_ips" {
  default = "0.0.0.0/0"
}

