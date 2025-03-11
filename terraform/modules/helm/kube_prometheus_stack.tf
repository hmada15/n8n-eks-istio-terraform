resource "helm_release" "kube_prometheus_stack" {
  name             = "kube-prom-stack"
  namespace        = "monitoring"
  create_namespace = true
  repository       = "https://prometheus-community.github.io/helm-charts"
  chart            = "kube-prometheus-stack"
  version          = "67.8.0"

  set {
    name  = "forceUpdate"
    value = 1
  }
  set {
    name  = "grafana.adminPassword"
    value = var.grafana_password
  }

  values = [
    "${file("${path.module}/values/prom-stack-values.yaml")}"
  ]

  timeout = 1200
  wait    = true
}
