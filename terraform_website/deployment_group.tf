resource "aws_iam_role" "hello-world" {
  name                  = "hello-world"

  assume_role_policy    = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": "codedeploy.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "AWSCodeDeployRole" {
  policy_arn            = "arn:aws:iam::aws:policy/service-role/AWSCodeDeployRole"
  role                  = "${aws_iam_role.hello-world.name}"
}

resource "aws_codedeploy_app" "hello-world" {
  compute_platform      = "Server"
  name                  = "hello-world"
}

resource "aws_codedeploy_deployment_group" "hello-world" {
  app_name              = "${aws_codedeploy_app.hello-world.name}"
  deployment_group_name = "hello-world-group"
  service_role_arn      = "${aws_iam_role.hello-world.arn}"
  
    auto_rollback_configuration {
    enabled             = true
    events              = ["DEPLOYMENT_FAILURE"]
  }

  alarm_configuration {
    alarms              = ["alarms-test"]
    enabled             = true
  }
}
