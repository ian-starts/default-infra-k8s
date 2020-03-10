# Terraform Helm provider needs Tiller access

resource "null_resource" "kubernetes_service_account_tiller" {
  provisioner "local-exec" {
    command = "kubectl --kubeconfig ${var.kubernetes_config} apply -f kubernetes/service_account_tiller.yaml"
  }
}