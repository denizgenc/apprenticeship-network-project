# Define a remote backend and remote state, to store sensitive data more securely
# (Since all data that gets generated by Terraform gets saved into the state, and this includes the
# database passwords, etc that Terraform is generating)
# This also involves creating an S3 bucket to act as the backend.

# s3 bucket with versioning
# I'm creating the backend bucket manually because I can't figure out how to create it in
# Terraform and then reference that in the backend configuration
# resource "aws_s3_bucket" "backend_bucket" {
#   bucket = "${var.name_prefix}-backend-bucket"
#   region = var.aws_region
#   versioning {
#     enabled = true
#   }
# }

# Create backend (remote state will be stored here)
# Unfortunately we can't reference variables here, so we have to use the following workaround
# detailed here: https://github.com/hashicorp/terraform/issues/13022#issuecomment-294262392
terraform {
  backend "s3" {
    bucket = "deniz-project-b-backend-bucket"
    key = "terraform.tfstate"
    region = "eu-west-2"
    encrypt = true
  }
}

# Retrieve remote state from above backend
data "terraform_remote_state" "remote_state" {
  backend = "s3"
  config = {
    bucket = "deniz-project-b-backend-bucket"
    key = "terraform.tfstate"
    region = "eu-west-2"
    encrypt = true
  }
}