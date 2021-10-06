variable "kubernetes_config" {
  default = "./../.kubeconfig"
}

variable "kubernetes_hetzner_csi_yaml" {
  default = "https://raw.githubusercontent.com/hetznercloud/csi-driver/v1.6.0/deploy/kubernetes/hcloud-csi.yml"
}

variable "hetzner_token" {
  default= ""
}

variable "kubernetes_cert_manager_crds_yaml" {
  default = "https://github.com/jetstack/cert-manager/releases/download/v1.5.3/cert-manager.crds.yaml"
}

variable "project_name" {
  default= "finway-prod"
}

variable "docker_hub_username" {
  default= ""
}

variable "docker_hub_password" {
  default= ""
}

variable "whitelist_ips" {
  default = "0.0.0.0/0"
}

