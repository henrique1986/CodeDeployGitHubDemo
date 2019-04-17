resource "aws_elb" "alb" {
  name                  = "terraform-asg-example"
  security_groups       = ["${aws_security_group.instance.id}"]
  availability_zones    = ["${data.aws_availability_zones.all.names}"]
  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    interval            = 30
    target              = "HTTP:8080/"
  }
  listener {
    lb_port             = 80
    lb_protocol         = "http"
    instance_port       = "8080"
    instance_protocol   = "http"
  }
}
