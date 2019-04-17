variable "test_key_pair_name" {}

variable "aws_access_key_id" {}

variable "aws_secret_access_key_id" {}

variable "aws_region" {
  default = "us-east-1"
}
variable "AMIS" {
  type = "map"
  default = {
    us-east-1 = "ami-13be557e"
    us-west-2 = "ami-06b94666"
    eu-west-1 = "ami-0d729a60"
  }
}
