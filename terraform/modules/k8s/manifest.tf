resource "kubectl_manifest" "users_cluster_role" {
  yaml_body = file("${path.module}/manifest/users-cluster-role.yaml")
}
