resource "aws_cloudwatch_log_group" "this" {
  name              = "/aws/eks/${aws_eks_cluster.eks.name}/cluster"
  retention_in_days = 7

  tags = var.terraform_tags
}
