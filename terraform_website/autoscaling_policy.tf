resource "aws_autoscaling_policy" "instances_autoscaling_policy" {
  name 				            = "instances_autoscaling_policy"
  scaling_adjustment 		  = 5
  adjustment_type 		    = "ChangeInCapacity"
  cooldown 			          = 100
  autoscaling_group_name 	= "${aws_autoscaling_group.instances_autoscaling_group.name}"
}
