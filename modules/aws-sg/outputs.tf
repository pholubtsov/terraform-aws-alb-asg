output "alb_sg_id" {
  value = aws_security_group.app_load_balancer_sg.id
}

output "launch_template_sg_id" {
  value = aws_security_group.launch_template_sg.id
}