resource "null_resource" "cert_manager_crds" {
  provisioner "local-exec" {
    command = "kubectl --kubeconfig ${var.kubernetes_config} apply --validate=false -f ${var.kubernetes_cert_manager_crds_yaml}"
  }
}

resource "kubernetes_namespace" "cert_manager" {
  metadata {
    name = "cert-manager"
  }

  lifecycle {
    ignore_changes = [metadata] # We have to ignore changes to the metadata because ranchers add it's own.
  }
}

resource "helm_release" "cert_manager" {
  depends_on = [null_resource.kubernetes_service_account_tiller]
  name = "cert-manager"
  namespace = kubernetes_namespace.cert_manager.metadata[0].name
  repository = "https://charts.jetstack.io"
  chart = "cert-manager"
  version = "v1.5.3"
}

resource "null_resource" "cert_manager_acme_issuers" {
  depends_on = [helm_release.cert_manager]
  provisioner "local-exec" {
    command = "kubectl --kubeconfig ${var.kubernetes_config} apply -f kubernetes/acme_issuers.yaml"
  }
}