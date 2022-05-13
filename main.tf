module "jenkins" {
    source = "./modules/jenkins"

}

module "k8s" {
    source = "./modules/k8s"

}
