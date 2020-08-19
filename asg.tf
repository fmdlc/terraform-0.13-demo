locals {
  asg_max = 5
  asg_min = 2
  asg_desired = 3
}

resource "aws_autoscaling_group" "asg" {
  name                      = "dc-solutions"
  max_size                  = local.asg_max
  min_size                  = local.asg_min
  health_check_grace_period = 300
  health_check_type         = "ELB"
  desired_capacity          = local.asg_desired
  force_delete              = true
  launch_configuration      = aws_launch_configuration.as_conf.name
  vpc_zone_identifier       = [
                              aws_subnet.main-us-east-1a.id,
                              aws_subnet.main-us-east-1b.id,
                              aws_subnet.main-us-east-1c.id
                              ]
  timeouts {
    delete = "15m"
  }

  tag {
    key                 = "Name"
    value               = "dc-solutions-webserver"
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_attachment" "asg_attachment" {
  autoscaling_group_name = aws_autoscaling_group.asg.id
  elb                    = aws_elb.elb.id
}