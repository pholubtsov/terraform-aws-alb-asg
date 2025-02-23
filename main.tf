# Configure the AWS provider
provider "aws" {
  region = "eu-central-1"
}

# ----------------------------------------------- #

# Retrieve Data block
data "aws_vpc" "default" {
  default = true
}

data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

# ----------------------------------------------- #

# Call the Security group module
module "aws-sg" {
  source                  = "./modules/aws-sg"
  alb_sg_name             = var.alb_sg_name
  launch_template_sg_name = var.launch_template_sg_name
  allowed_ip_web          = var.allowed_ip_web
  allowed_ip_ssh          = var.allowed_ip_ssh
}

# ----------------------------------------------- #

# Call the Load balancer module
module "aws-alb" {
  source                = "./modules/aws-alb"
  vpc_id                = data.aws_vpc.default.id
  alb_target_group_name = var.alb_target_group_name
  alb_name              = var.alb_name
  alb_security_groups   = module.aws-sg.alb_sg_id
  subnets               = data.aws_subnets.default.ids
}

# ----------------------------------------------- #

# Call the Auto Scaling Group module
module "aws-asg" {
  source               = "./modules/aws-asg"
  ami                  = var.ami
  asg_name             = var.asg_name
  launch_template_name = var.launch_template_name
  launch_template_sg   = module.aws-sg.launch_template_sg_id
  instance_type        = var.instance_type
  target_group_arn     = module.aws-alb.alb_target_group_arn
  subnets              = data.aws_subnets.default.ids
  topic_arn            = module.aws-sns.sns_topic_arn
  ssh_key_name         = var.ssh_key_name
  min_size             = var.min_size
  max_size             = var.max_size
  desired_capacity     = var.desired_capacity
}

# ----------------------------------------------- #

# Call the SNS module

module "aws-sns" {
  source             = "./modules/aws-sns"
  notification_email = var.notification_email
}
