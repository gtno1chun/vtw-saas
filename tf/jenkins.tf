resource "kubernetes_namespace" "jenkins_ns" {
  metadata {
    annotations = {
      name = "jenkins"
    }

    labels = {
      mylabel = "jenkins"
    }

    name = "jenkins"
  }
}

resource "helm_release" "jenkins" {

  depends_on = [
    kubernetes_namespace.jenkins_ns, 
  ]
  name = "jenkins"
  namespace = "jenkins"
  #repository = "jenkins/jenkins"
  version = "4.1.7" 
  chart = "./helm/charts/jenkins"

  values = [
    file("./helm/charts/jenkins/values.yaml")
  ]

  set {
    name = "controller.adminUser"
    value = "admin"
  }
  
#  set {
#    name = "controller.adminPassword"
#    value = "admin"
#  }
#  
#  set {
#    name = "controller.serviceType"
#    value = "NodePort"
#  }
}



