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
  description = "CIDR block allowed for HTTP(S) access"
}

variable "allowed_ip_ssh" {
  type        = string
  description = "CIDR block to allowed SSH access"
}

variable "inbound_ports_web" {
  type        = list(number)
  description = "List of inbound ports to be opened"
  default     = [80, 443]
}
