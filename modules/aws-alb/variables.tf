variable "alb_name" {
  type        = string
  description = "Name of the Application Load Balancer"
}

variable "alb_target_group_name" {
  type        = string
  description = "Name of the target group for the Application Load Balancer"
}

variable "alb_security_groups" {
  type        = string
  description = "ID of the security group for the Application Load Balancer"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID to use for the Application Load Balancer"
}

variable "subnets" {
  type        = list(string)
  description = "List of subnet IDs for the Application Load Balancer"
}
