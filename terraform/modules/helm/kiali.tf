resource "helm_release" "kiali" {
  name       = "kiali"
  namespace  = "monitoring"
  repository = "https://kiali.org/helm-charts"
  chart      = "kiali-operator"
  version    = "2.5.0"

  set {
    name  = "cr.spec.external_services.grafana.auth.password"
    value = var.grafana_password
  }

  values = [file("${path.module}/values/kiali_values.yaml")]
}
