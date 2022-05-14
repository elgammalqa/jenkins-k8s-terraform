
provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}


resource "helm_release" "jenkins" {
  name       = "jenkins"
  repository = "./helm"
  chart      = "jenkins"
  namespace  = "jenkins"

  values = [
    "${file("./helm/values.yaml")}"
  ]

  set_sensitive {
    name  = "controller.adminUser"
    value = ""
  }
  set_sensitive {
    name = "controller.adminPassword"
    value = ""
  }
  set_sensitive {
    name = "adminPassword"
    value = ""
  }
}