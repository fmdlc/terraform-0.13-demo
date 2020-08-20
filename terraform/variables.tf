#************************************************
# AWS VPC and ENV configuration
#************************************************
variable environment {
  description = "Account environment"
  default     = "prod"
}

variable aws_region {
  description = "Default AWS region"
  type        = string
  default     = "us-east-1"
  validation {
    condition     = can(regex("^us-", var.aws_region))
    error_message = "This Terraform is supposed to run in us-east-1."
  }
}
#
variable "vpc_public_subnets" {
  type = map
  default = {
    us-east-1a = "10.0.1.0/24"
    us-east-1b = "10.0.2.0/24"
    us-east-1c = "10.0.3.0/24"
  }
}

# Allowed IP addresses
variable allowed_ip_addr {
  description = "List of allowed IP addresses"
  type        = list
  default = [
    "200.200.200.200/32",
    "100.100.100.100/32"
  ]
}
#************************************************
# ELB Configuration
#************************************************
variable dc_elb {
  description = "elb name"
  default     = "www"
}

locals {
  elb_connection = {
    frontend_port     = 80
    frontend_protocol = "http"
    backend_port      = 80
    backend_protocol  = "http"

    healthy_threshold    = 2
    unhealthy_threshold  = 3
    healthcheck_target   = "HTTP:80/"
    healthcheck_interval = 60
    healthcheck_timeout  = 30
  }
}
#************************************************
# Launch template configuration for ASG
#************************************************
variable ami_id {
  description = "AWS AMI ID to be used"
  type        = string
  default     = "ami-0554ad98cb6204c6e"
  validation {
    condition     = can(regex("^ami-", var.ami_id))
    error_message = "Argument ami_id must be a valid AMI id, starting with \"ami-\"."
  }
}

variable webservers_name {
  description = "DC Webserver name"
  default     = "dc-webserver"
}

variable webserver_instance_type {
  description = "Webserver instance type"
  default     = "t2.micro"
}

# ASG Configuration
locals {
  asg_configuration = {
    asg_min      = 2
    asg_max      = 5
    asg_desired  = 3
    force_delete = true
  }
}
#************************************************
# SSH access configuration
#************************************************
variable ssh_public_key_name {
  description = "SSH key used for instances login"
  default     = "infrastructure"
}

variable ssh_public_key_location {
  description = "SSH key used for instances login"
  default     = "/Users/tty0/.ssh/id_rsa.pub"
}
#************************************************
# Database configuration
#************************************************
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

variable database_multi_az {
  description = "Enable multi AZ"
  default     = false
}

# db.t2.micro:
#   - CPU: 1vcore / 1vcpu
#   - Memory: 1 GiB
#   - Credits:  6 per hour
variable database_type {
  description = "Database instance type"
  default     = "db.t2.micro"
  validation {
    condition     = can(regex("db.t2.micro", var.database_type))
    error_message = "Only db.t2.micro instances allowed, the other are really expensive."
  }
}

variable database_identifier {
  description = "Database name"
  default     = "db-01"
}

variable database_name {
  description = "Database name"
  default     = "db"
}

variable database_username {
  description = "Database username"
  default     = "postgres"
}
