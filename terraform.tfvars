# COMMON VARIABLES
region = "eu-central-1"                                     # AWS region to deploy resources

# SECURITY GROUPS VARIABLES
alb_sg_name             = "ALB-SG-by-Terraform"             # Name of the security group for the ALB
launch_template_sg_name = "Launch-Template-SG-by-Terraform" # Name of the security group for the launch template
allowed_ip_web          = "0.0.0.0/0"                       # IP range allowed to access the web (HTTP/HTTPS)
allowed_ip_ssh          = "0.0.0.0/0"                       # IP range allowed to access via SSH

# LOAD BALANCER VARIABLES
alb_target_group_name = "TG-by-Terraform"                   # Name of the target group for the ALB
alb_name              = "ALB-by-Terraform"                  # Name of the Application Load Balancer

# AUTO SCALING GROUP VARIABLES
asg_name             = "ASG-by-Terraform"                   # Name of the Auto Scaling Group
launch_template_name = "Launch-Template-by-Terraform"       # Name of the launch template
ami                  = "ami-0338044f680925d64"              # AMI ID for the EC2 instances
instance_type        = "t2.micro"                           # EC2 instance type
ssh_key_name         = "aws_ec2_ssh_key"                    # SSH key name for accessing EC2 instances
min_size             = 1                                    # Minimum number of instances in the Auto Scaling Group
max_size             = 3                                    # Maximum number of instances in the Auto Scaling Group
desired_capacity     = 2                                    # Desired number of instances in the Auto Scaling Group

# SIMPLE NOTIFICATION SERVICE VARIABLES
notification_email = "your.email@example.com"               # Email address for SNS notifications
