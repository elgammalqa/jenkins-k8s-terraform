
provider "helm" {
  kubernetes {
    config_path = "/home/amir/.kube/config"
  }
}


resource "helm_release" "jenkins02" {
  name       = "jenkins02"
  repository = "https://charts.jenkins.io"
  chart      = "jenkins"

  values = [
    "${file("./helm/jenkins-values.yaml")}"
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