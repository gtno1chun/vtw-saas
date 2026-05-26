resource "kubernetes_namespace" "monitoring" {
  metadata {
    name = "monitoring"  
  }
}


resource "helm_release" "prometheus_stack" {
  name       = "kube-prometheus-stack"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "kube-prometheus-stack"
  namespace  = kubernetes_namespace.monitoring.metadata[0].name
  version    = "85.3.2"


  set {
    name = "grafana.adminPassword"
    value = "admin1234" 
  }

}

