resource "helm_release" "n8n" {
  name             = "n8n"
  repository       = "oci://8gears.container-registry.com/library/n8n"
  chart            = "n8n"
  version          = "1.0.0"
  namespace        = "n8n"
  create_namespace = true

  values = [
    templatefile("${path.module}/values/n8n.yaml", {
      db_host        = var.rds_postgres_address,
      db_port        = var.rds_postgres_port,
      db_username    = var.db_username,
      db_password    = var.db_password,
      encryption_key = var.n8n_encryption_key
    })
  ]
}

