variable "kubernetes_config" {
  default = "./../.kubeconfig"
}

variable "kubernetes_hetzner_csi_yaml" {
  default = "https://raw.githubusercontent.com/hetznercloud/csi-driver/v1.2.2/deploy/kubernetes/hcloud-csi.yml"
}

variable "hetzner_token" {
  default= "wGo6CF6bp6j28at8Hep98STv1ksQ2zW3YTZF2bgZGWgJr4d5krks5wICOFnl2Kze"
}

variable "kubernetes_cert_manager_crds_yaml" {
  default = "https://raw.githubusercontent.com/jetstack/cert-manager/release-0.12/deploy/manifests/00-crds.yaml"
}

variable "project_name" {
  default= "loopground-prod"
}

variable "docker_hub_username" {
  default= "yikdev"
}

variable "docker_hub_password" {
  default= "Y@4svoT15S*l"
}

variable "whitelist_ips" {
  default = "0.0.0.0/0"
}

