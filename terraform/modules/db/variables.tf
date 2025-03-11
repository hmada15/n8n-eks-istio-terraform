variable "db_allocated_storage" {
  type = number
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
variable "db_backup_retention_period" {
  type = number
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
