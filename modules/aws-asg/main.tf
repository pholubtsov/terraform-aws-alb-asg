# Launch Template Configuration
resource "aws_launch_template" "app_launch_template" {
  name                   = var.launch_template_name
  image_id               = var.ami
  instance_type          = var.instance_type
  key_name               = var.ssh_key_name
  vpc_security_group_ids = [var.launch_template_sg]

  user_data = filebase64("./modules/aws-asg/nginx-and-cron-job.sh")
}

# Auto Scaling Group Configuration
resource "aws_autoscaling_group" "app_asg" {
  launch_template {
    id      = aws_launch_template.app_launch_template.id
    version = "$Latest"
  }

  name                      = var.asg_name
  min_size                  = var.min_size
  max_size                  = var.max_size
  desired_capacity          = var.desired_capacity
  health_check_grace_period = 60
  health_check_type         = "ELB"

  target_group_arns = [var.target_group_arn]

  vpc_zone_identifier = var.subnets
}

# Notifications Configuration
resource "aws_autoscaling_notification" "app_asg_notifications" {
  group_names   = [aws_autoscaling_group.app_asg.name]
  topic_arn     = var.topic_arn
  notifications = ["autoscaling:EC2_INSTANCE_LAUNCH", "autoscaling:EC2_INSTANCE_TERMINATE"]
}

# Scheduled Scaling Actions
# resource "aws_autoscaling_schedule" "scale_out" {
#   scheduled_action_name  = "Scale-Out"
#   autoscaling_group_name = aws_autoscaling_group.app_asg.name
#   desired_capacity       = 3
#   min_size               = 1
#   max_size               = 3
#   start_time             = "2025-02-22T21:10:00Z"
# }
# 
# resource "aws_autoscaling_schedule" "scale_in" {
#   scheduled_action_name  = "Scale-In"
#   autoscaling_group_name = aws_autoscaling_group.app_asg.name
#   desired_capacity       = 2
#   min_size               = 1
#   max_size               = 3
#   start_time             = "2025-02-22T21:15:00Z"
# }
