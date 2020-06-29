resource "null_resource" "kubernetes_secret_docker_hub_registry" {
  provisioner "local-exec" {
    command = "kubectl --kubeconfig ${var.kubernetes_config} create secret docker-registry docker-hub-${var.project_name}-registry --docker-server=https://index.docker.io/v1/ --docker-username=${var.docker_hub_username} --docker-password=${var.docker_hub_password}"
  }
}