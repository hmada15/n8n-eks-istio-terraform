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
variable "grafana_password" {
  type = string
}

# RDS connection vars
variable "db_username" {
  type = string
}
variable "db_password" {
  type      = string
  sensitive = true
}
variable "rds_postgres_address" {
  type = string
}
variable "rds_postgres_port" {
  type = string
}

variable "n8n_encryption_key" {
  type = string
}
