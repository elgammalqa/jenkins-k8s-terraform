provider "kubernetes" {
  config_path = "/home/amir/.kube/config"
}

resource "kubernetes_namespace" "jenkins" {
  metadata {
    name = "jenkins"
  }
}