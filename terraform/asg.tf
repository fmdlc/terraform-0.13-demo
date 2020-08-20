resource "aws_autoscaling_group" "asg" {
  name                      = "foobar"
  max_size                  = local.asg_configuration.asg_max
  min_size                  = local.asg_configuration.asg_min
  health_check_grace_period = 300
  health_check_type         = "EC2"
  desired_capacity          = local.asg_configuration.asg_desired
  force_delete              = local.asg_configuration.force_delete
  vpc_zone_identifier       = [for s in local.subnet_ids_list: s]
  load_balancers            = [aws_elb.elb.id]
  launch_configuration      = aws_launch_configuration.as_conf.name
  timeouts {
    delete = "15m"
  }

  tag {
    key                 = "Name"
    value               = "foobar"
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_attachment" "asg_attachment" {
  autoscaling_group_name = aws_autoscaling_group.asg.id
  elb                    = aws_elb.elb.id
}