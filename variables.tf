# -------------------------- Common variables -------------------------- #
variable "region" {
  type        = string
  description = "AWS region to deploy resources"
}


# -------------------------- Security Groups module variables -------------------------- #
variable "alb_sg_name" {
  type        = string
  description = "Name of the security group for an Application Load Balancer"
}

variable "launch_template_sg_name" {
  type        = string
  description = "Name of the security group for a Launch Template"
}

variable "allowed_ip_web" {
  type        = string
  description = "CIDR block to allowed for HTTP(S) access"
}

variable "allowed_ip_ssh" {
  type        = string
  description = "CIDR block to allowed for SSH access"
}


# -------------------------- Auto-Scaling Group module variables -------------------------- #
variable "ami" {
  type        = string
  description = "AMI ID to use for an EC2 instances in the Auto-Scaling Group"
}

variable "instance_type" {
  type        = string
  description = "Instance type for the EC2 instances in the Auto-Scaling Group"
}

variable "asg_name" {
  type        = string
  description = "Name of the Auto-Scaling Group"
}

variable "launch_template_name" {
  description = "Launch Template name"
  type        = string
}

variable "ssh_key_name" {
  type        = string
  description = "SSH key name to import to the EC2 instances in the Auto-Scaling Group"
}

variable "min_size" {
  type        = number
  description = "Default minimum number of instances in the Auto-Scaling Group"
}

variable "max_size" {
  type        = number
  description = "Default maximum number of instances in the Auto-Scaling Group"
}

variable "desired_capacity" {
  type        = number
  description = "Default desired number of instances in the Auto-Scaling Group"
}


# -------------------------- Application Load Balancer module variables -------------------------- #
variable "alb_target_group_name" {
  type        = string
  description = "Name of the target group for the Application Load Balancer"
}

variable "alb_name" {
  type        = string
  description = "Name of the Application Load Balancer"
}


# -------------------------- SNS module variables -------------------------- #
variable "notification_email" {
  type        = string
  description = "Email address to receive notifications"
}
