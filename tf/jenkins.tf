resource "kubernetes_namespace" "jenkins_ns" {
  metadata {
    name = "jenkins"
  }
}


resource "helm_release" "jenkins" {
  name = "jenkins"
  namespace = "jenkins"
  # repository = "jenkins/jenkins"
  version = "4.6.4" 
  chart = "./charts/jenkins"

  values = [
    file("./charts/jenkins/values.yaml")
  ]

  set {
    name = "controller.adminUser"
    value = "admin"
  }
  
  set {
    name = "controller.adminPassword"
    value = "admin"
  }
  

}

