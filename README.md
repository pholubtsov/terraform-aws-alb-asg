# Terraform AWS ALB & ASG

This repository contains Terraform configurations to deploy an **Application Load Balancer (ALB)** and an **Auto Scaling Group (ASG)** in AWS. The setup ensures high availability and scalability of EC2 instances behind a load balancer.

## Features
- 🚀 **Application Load Balancer (ALB)** with listener and target group.
- 🏗️ **Auto Scaling Group (ASG)** with EC2 instances.
- 📝 **Automated index.html update script** on EC2 instances within the ASG.
- 📢 **SNS Notifications** for Auto Scaling events.
- 🔐 **Security Groups** for controlled access.
- 🛠️ **Terraform remote backend (S3)** for state management.

⚠️ Example `.tfvars` files are included for reference, but exposing these files publicly is highly discouraged as they may contain sensitive configuration values.

## Prerequisites
Before deploying, ensure you have:
- AWS CLI configured with valid credentials.
- Terraform installed (version >= 1.0.0).
- An existing **VPC** with at least two subnets in different availability zones.

## Usage
### 1️⃣ Clone the repository
git clone https://github.com/pholubtsov/terraform-aws-alb-asg.git
cd terraform-aws-alb-asg

### 2️⃣ Initialize Terraform
terraform init

### 3️⃣ Plan the deployment
terraform plan

### 4️⃣ Apply the configuration
terraform apply -auto-approve


## Terraform Outputs
- **alb_dns_name** - The DNS name of the Application Load Balancer.
- **alb_security_group_id** - The ID of the security group associated with the Application Load Balancer.
- **asg_arn** - The ARN of the Auto Scaling Group.
- **launch_template_id** - The ID of the launch template used by the Auto Scaling Group.
- **launch_template_security_group_id** - The ID of the security group associated with the launch template.
- **target_group_arn** - The ARN of the target group associated with the Application Load Balancer.
- **sns_topic_arn** - The ARN of the SNS topic for Auto Scaling notifications.

## Cleanup
To destroy all resources:
terraform destroy -auto-approve

## License
MIT License. Feel free to use and modify.
