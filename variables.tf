#------------------------------------------------------------------------------
# AWS variables definition
#------------------------------------------------------------------------------
variable aws_region {
  description = "Default AWS region"
  type        = string
  default     = "us-east-1"
}

variable ami_id {
  description = "AWS AMI ID to be used"
  default     = "ami-07ac83da491610c29"
}

variable dc_webservers_name {
  description = "DC Webserver name"
  default     = "dc-webserver"
}

variable dc_webserver_instance_type {
  description = "DC Webserver instance type"
  default     = "t2.micro"
}

variable ssh_public_key_name {
  description = "SSH key used for instances login"
  default     = "infrastructure"
}

variable ssh_public_key_location {
  description = "SSH key used for instances login"
  default     = "/Users/tty0/.ssh/id_rsa.pub"
}

variable database_storage_size {
  description = "Size of allocated storage to the Database"
  default     = 5
}

variable database_storage_type {
  description = "Storage type"
  default     = "gp2"
}

variable database_engine {
  description = "Database engine to be used"
  default     = "mysql"
}

variable database_engine_version {
  description = "Version of the engine to be used"
  default     = "5.7"
}

#------------------------------------------------
# db.t2.micro:
#   - CPU: 1vcore / 1vcpu
#   - Memory: 1 GiB
#   - Credits:  6 per hour
#------------------------------------------------
variable database_type {
  description = "Database instance type"
  default     = "db.t2.micro"
}

variable database_name {
  description = "Database name"
  default     = "dc-solutions-db"
}

variable database_username {
  description = "Database username"
  default     = "postgres"
}

variable database_password {
  description = "Database password"
  default     = ""
}

variable dc_elb {
  description = "ELB Name"
  default = "dc-solutions-www"
}
