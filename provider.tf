#------------------------------------------------------------------------------
# AWS provider definition
#	After generate your AWS Access/Secret key set your AWS profile name here.
# 	Configure your aws profile calling the awscli
#	$ aws config --profile <profile_name>
#
#------------------------------------------------------------------------------
provider "aws" {
  region  = var.aws_region
  profile = "default"
}
