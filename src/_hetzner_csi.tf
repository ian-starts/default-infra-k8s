resource "kubernetes_secret" "csi_secret" {
  metadata {
    name = "hcloud-csi"
    namespace = "kube-system"
  }

  data = {
    token = var.hetzner_token
  }
}

resource "null_resource" "hetnzer_csi_driver" {
  depends_on = [kubernetes_secret.csi_secret]

  provisioner "local-exec" {
    command = "kubectl --kubeconfig ${var.kubernetes_config} apply -f ${var.kubernetes_hetzner_csi_yaml}"
  }
}