resource "kubernetes_namespace" "prometheus_ns" {
  metadata {
    annotations = {
      name = "prometheus"
    }
    labels = {
      role = "prometheus"
    }
    name = "prometheus"
  }
}


resource "helm_release" "prometheus" {
  depends_on = [
    kubernetes_namespace.prometheus_ns,
    #helm_release.ebs-csi-controller,
  ]

  repository    = "https://prometheus-community.github.io/helm-charts"
  chart         = "kube-prometheus-stack"
  version       = "51.0.3"
  name          = "prometheus"
  namespace     = "prometheus"

  recreate_pods = true


  values = [
    file("./helm/charts/kube-prometheus-stack/values.yaml")
  ]

  set {
    name  = "metrics.enabled"
    value = true
  }
  set {
    name  = "metrics.serviceMonitor.enabled"
    value = true
  }

  # ## volume.beta.kubernetes.io/storage-provisioner: ebs.csi.aws.com
  # set {
  #   name  = "volume.beta.kubernetes.io/storage-provisioner"
  #   value = "ebs.csi.aws.com"
  # }

}

