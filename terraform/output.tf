output "mysql_username" {
  value = var.database_username
}

output "mysql_password" {
  value = random_password.password.result
}

output "mysql_endpoint" {
  value = aws_db_instance.dc-solutions-db.endpoint
}