resource "aws_autoscaling_group" "instances_autoscaling_group" {
  launch_configuration  = "${aws_launch_configuration.lc.id}"
  availability_zones    = ["${data.aws_availability_zones.all.names}"]
  min_size              = 3
  max_size              = 10
  load_balancers        = ["${aws_elb.alb.name}"]
  launch_configuration {
    id                  = "${aws_launch_configuration.lc.id}"
    version             = "$Latest"
  }
}
