output "alb-dns-name" {
  description = "DNS name of the ALB"
  value       = module.aws-alb.alb_dns_name
}

output "target_group_arn" {
  description = "ARN of the ALB target group"
  value       = module.aws-alb.alb_target_group_arn
}

output "alb_security_group_id" {
  description = "Security Group ID of the ALB"
  value       = module.aws-sg.alb_sg_id
}

output "asg_arn" {
  description = "The ARN of the ASG"
  value       = module.aws-asg.asg_arn
}

output "launch_template_security_group_id" {
  description = "Security Group ID of the ASG instances"
  value       = module.aws-sg.launch_template_sg_id
}

output "launch_template_id" {
  description = "The ID of the launch template"
  value       = module.aws-asg.launch_template_id
}

output "sns_topic_arn" {
  description = "The ARN of the SNS topic"
  value       = module.aws-sns.sns_topic_arn
}
