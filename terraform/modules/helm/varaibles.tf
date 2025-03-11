variable "env" {
  type = string
}
variable "eks_cluster_name" {
  type = string
}
variable "vpc_id" {
  type = string
}
variable "eks_cluster_node_id" {
  type = string
}
variable "region" {
  type = string
}
variable "terraform_tags" {
  type = map(any)
}
