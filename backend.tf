#------------------------------------------------------------------------------
# AWS Backend configuration
#
#------------------------------------------------------------------------------
terraform {
  backend "s3" {
    bucket = "dcsolutions-tfstate"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}
