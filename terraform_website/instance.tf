provider "aws" {
 access_key	    = "aws_access_key_id"
 secret_key     = "aws_secret_access_key_id"
 region         = "us-east-1"
}

resource "aws_instance" "test_ubuntu" {
  ami           = "ami-0de53d8956e8dcf80"
  instance_type = "t2.micro"
  key_name      = "test_key_pair_name"
  
  tags {
    name        = "test_ubuntu"
  }
}
