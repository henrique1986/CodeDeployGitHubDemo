resource "aws_launch_configuration" "lc" {
  image_id 		= "ami-123456789"
  instance_type 	= "t2.micro"
  security_groups       = ["${aws_security_group.instance.id}"]
  key_name              = "${aws_key_name.test_key_pair_name.name}"
}
