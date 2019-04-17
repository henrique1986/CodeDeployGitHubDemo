provider "aws" {
 access_key	= "${var.aws_access_key_id}"
 secret_key     = "${var.aws_secret_access_key_id}"
 region         = "${var.aws_region}"
}

resource "aws_instance" "test_ubuntu" {
  ami           = ""${lookup(var.AMIS, var.aws_region)}""
  instance_type = "t2.micro"
  key_name      = "${var.test_key_pair_name}"
  
  tags {
    name        = "test_ubuntu"
  }
}
