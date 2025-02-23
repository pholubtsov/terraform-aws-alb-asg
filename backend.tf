# Using state file from S3 bucket 
terraform {
  backend "s3" {
    # Configuration is stored in ./backend/backend.tfvars
    # Run terraform init -backend-config=./backend/backend.tfvars
  }
}
