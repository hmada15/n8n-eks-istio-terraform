output "eks_cluster_name" {
  value = aws_eks_cluster.eks.name
}
output "eks_cluster_node_id" {
  value = aws_eks_node_group.general.id
}
