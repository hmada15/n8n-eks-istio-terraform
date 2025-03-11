resource "aws_db_instance" "postgres" {
  db_name           = var.db_name
  allocated_storage = var.db_allocated_storage
  storage_type      = var.db_storage_type
  engine            = "postgres"
  engine_version    = var.db_engine_version
  instance_class    = var.db_instance_class

  username                     = var.db_username
  password                     = var.db_password
  parameter_group_name         = var.db_parameter_group_name
  multi_az                     = true
  publicly_accessible          = false
  storage_encrypted            = true
  backup_retention_period      = var.db_backup_retention_period
  skip_final_snapshot          = false
  final_snapshot_identifier    = "${var.db_identifier}-final"
  deletion_protection          = true
  monitoring_interval          = 60
  performance_insights_enabled = true

  vpc_security_group_ids = var.db_security_group_ids
  db_subnet_group_name   = var.db_subnet_group_name
}
