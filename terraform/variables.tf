variable "env" {
  default = "staging"
  type    = string
}
variable "region" {
  default = "us-east-2"
  type    = string
}
variable "zone1" {
  default = "us-east-2a"
  type    = string
}
variable "zone2" {
  default = "us-east-2b"
  type    = string
}
variable "eks_name" {
  default = "demo"
  type    = string
}
variable "eks_version" {
  default = "1.30"
  type    = string
}
variable "terraform_tags" {
  type = map(any)
  default = {
    "provisioner" : "terraform"
  }
}
variable "grafana_password" {
  type = string
}

# DB variables
variable "db_name" {
  type = string
}
variable "db_username" {
  type = string
}
variable "db_password" {
  type      = string
  sensitive = true
}
variable "db_parameter_group_name" {
  type = string
}
variable "db_identifier" {
  type = string
}
variable "db_security_group_ids" {
  type = list(string)
}
variable "db_subnet_group_name" {
  type = string
}
variable "db_allocated_storage" {
  type = string
}
variable "db_storage_type" {
  type = string
}
variable "db_engine_version" {
  type = string
}
variable "db_instance_class" {
  type = string
}
variable "db_backup_retention_period" {
  type = string
}
variable "n8n_encryption_key" {
  type = string
}
