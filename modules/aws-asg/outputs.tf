output "launch_template_id" {
  description = "The ID of the launch template"
  value       = aws_launch_template.app_launch_template.id
}

output "asg_arn" {
  description = "The ARN of the ASG"
  value       = aws_autoscaling_group.app_asg.arn
}
