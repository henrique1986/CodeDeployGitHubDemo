resource "aws_launch_configuration" "lc" {
  image_id        = "${lookup(var.amis,var.aws_region)}"
  instance_type   = "t2.micro"
  security_groups = ["${aws_security_group.instance.id}"]
  key_name        = "${var.test_key_pair_name}"
}
