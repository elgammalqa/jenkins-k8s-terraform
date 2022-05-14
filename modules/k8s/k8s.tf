provider "kubernetes" {
  config_path = "/home/amir/.kube/config"
}

resource "kubernetes_namespace" "jenkins" {
  metadata {
    name = "jenkins"
  }
}

resource "kubernetes_service_account" "jenkins-sa" {
  metadata {
    name = "jenkins"
    namespace = "jenkins"
  }
}

resource "kubernetes_cluster_role" "jenkins-cr" {
  metadata {
    name = "jenkins"
  }

  rule {
    api_groups = [""]
    resources  = ["namespaces", "pods", "statefulsets", "pods/exec", "services", "jobs", "secrets" ]
    verbs      = ["get", "list", "watch", "update", "create"]
  }
}

resource "kubernetes_cluster_role_binding" "jenkins-rb" {
  metadata {
    name = "jenkins"
  }
  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = "jenkins"
  }

  subject {
    kind      = "ServiceAccount"
    name      = "jenkins"
    namespace = "default"
  }
  subject {
    kind      = "Group"
    name      = "system:serviceaccounts:jenkins"
    api_group = "rbac.authorization.k8s.io"
  }
}
