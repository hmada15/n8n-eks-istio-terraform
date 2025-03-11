resource "helm_release" "istio_base" {
  name             = "istio-base"
  namespace        = "istio-system"
  create_namespace = true
  repository       = "https://istio-release.storage.googleapis.com/charts"
  chart            = "base"
  version          = "1.25.0"

  timeout = 1200
  wait    = true
}

resource "helm_release" "istiod" {
  name             = "istiod"
  namespace        = "istio-system"
  create_namespace = true
  repository       = "https://istio-release.storage.googleapis.com/charts"
  chart            = "istiod"
  version          = "1.25.0"

  set {
    name  = "meshConfig.accessLogEncoding"
    value = "JSON"
  }
  values = [
    "${file("${path.module}/values/istio_values.yaml")}"
  ]

  timeout = 1200
  wait    = true
  depends_on = [
    helm_release.istio_base,
  ]
}

resource "helm_release" "istio-ingress" {
  name             = "istio-ingress"
  namespace        = "istio-ingress"
  create_namespace = true
  repository       = "https://istio-release.storage.googleapis.com/charts"
  chart            = "gateway"
  version          = "1.25.0"

  force_update  = true
  recreate_pods = true
  description   = "force update 1"
  set {
    name  = "service.type"
    value = "LoadBalancer"
  }
  set {
    name  = "service.externalTrafficPolicy"
    value = "Local"
  }
  values = [
    "${file("${path.module}/values/istio_ingress_values.yaml")}"
  ]

  timeout = 1200
  wait    = true
  depends_on = [
    helm_release.istio_base,
    helm_release.istiod,
  ]
}
