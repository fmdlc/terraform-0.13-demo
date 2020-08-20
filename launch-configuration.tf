resource "aws_launch_configuration" "as_conf" {
  name              = var.webservers_name
  image_id          = var.ami_id
  instance_type     = var.webserver_instance_type
  key_name          = var.ssh_public_key_name
  security_groups   = [aws_security_group.trusted.id]
  associate_public_ip_address = true
  user_data_base64  = "IyEvYmluL2Jhc2gKCnl1bSAteSBpbnN0YWxsIG5naW54CmV4aXQgJD8="
}