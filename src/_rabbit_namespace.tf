# RabbitMQ needs his own namespace

resource "null_resource" "rabbitmq_namespace" {
  provisioner "local-exec" {
    command = "kubectl --kubeconfig ${var.kubernetes_config} create namespace rabbit"
  }
}