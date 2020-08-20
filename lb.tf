resource "aws_elb" "elb" {
  name            = var.dc_elb
  security_groups = [aws_security_group.trusted.id]
  internal        = false
  subnets         = [for s in local.subnet_ids_list : s]

  listener {
    instance_port     = local.elb_connection.backend_port
    instance_protocol = local.elb_connection.backend_protocol
    lb_port           = local.elb_connection.frontend_port
    lb_protocol       = local.elb_connection.backend_protocol
  }

  health_check {
    healthy_threshold   = local.elb_connection.healthy_threshold
    unhealthy_threshold = local.elb_connection.unhealthy_threshold
    timeout             = local.elb_connection.healthcheck_timeout
    target              = local.elb_connection.healthcheck_target
    interval            = local.elb_connection.healthcheck_interval
  }

  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

  tags = {
    Name      = "foobar"
    Terraform = "True"
  }
}
