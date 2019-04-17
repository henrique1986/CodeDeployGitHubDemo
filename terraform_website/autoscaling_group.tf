resource "aws_autoscaling_group" "instances_autoscaling_group" {
  min_size              = 3
  max_size              = 10
  load_balancers        = ["${aws_elb.alb.name}"]
  launch_configuration {
    id                  = "${aws_launch_configuration.lc.id}"
    version             = "$Latest"
  }
}
