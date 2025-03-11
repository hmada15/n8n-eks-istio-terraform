output "rds_postgres_address" {
  value       = aws_db_instance.postgres.address
  description = "Database endpoint for establishing a connection to the database."
}

output "rds_postgres_port" {
  value       = aws_db_instance.postgres.port
  description = "Database port for establishing a connection to the database."
}
