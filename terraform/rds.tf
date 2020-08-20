#------------------------------------------------
# RDS instances definition
#------------------------------------------------
resource "random_password" "password" {
  length           = 16
  special          = true
  override_special = "_%@"
}

resource "aws_db_subnet_group" "default" {
  name       = "main"
  subnet_ids = [for s in local.subnet_ids_list : s]

  tags = {
    Name = "My DB subnet group"
  }
}

resource "aws_db_instance" "dc-solutions-db" {
  allocated_storage        = var.database_storage_size
  storage_type             = var.database_storage_type
  engine                   = var.database_engine
  engine_version           = var.database_engine_version
  instance_class           = var.database_type
  identifier               = var.database_identifier
  username                 = var.database_username
  name                     = var.database_name
  db_subnet_group_name     = aws_db_subnet_group.default.name
  password                 = random_password.password.result
  multi_az                 = var.database_multi_az
  vpc_security_group_ids   = list(aws_security_group.trusted.id)
  parameter_group_name     = aws_db_parameter_group.default.id
  skip_final_snapshot      = true
  delete_automated_backups = true
}

resource "aws_db_parameter_group" "default" {
  name   = "rds-parameter-group"
  family = "mysql5.7"

  parameter {
    name  = "character_set_server"
    value = "utf8"
  }

  parameter {
    name  = "character_set_client"
    value = "utf8"
  }
}
