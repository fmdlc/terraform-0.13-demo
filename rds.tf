#------------------------------------------------
# RDS instances definition
#------------------------------------------------
resource "aws_db_instance" "dc-solutions-db" {
  allocated_storage    = var.database_storage_size
  storage_type         = var.database_storage_type
  engine               = var.database_engine
  engine_version       = var.database_engine_version
  instance_class       = var.database_type
  name                 = var.database_name
  username             = var.database_username
  password             = var.database_password
  parameter_group_name = aws_db_parameter_group.default.id
}

resource "aws_db_parameter_group" "default" {
  name   = "rds-dc-solutions"
  family = "mysql5.6"

  parameter {
    name  = "character_set_server"
    value = "utf8"
  }

  parameter {
    name  = "character_set_client"
    value = "utf8"
  }
}
