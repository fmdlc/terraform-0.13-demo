resource "aws_key_pair" "ssh-us-east-1" {
  key_name   = var.ssh_public_key_name
  public_key = file("${var.ssh_public_key_location}")
}
