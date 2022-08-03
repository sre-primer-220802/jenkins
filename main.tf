provider "aws" {
  region  = "us-east-1"
  profile = "revature-terraform"
}

terraform {
  backend "s3" {
    bucket  = "sre-primer-terraform"
    key     = "jenkins/terraform.tfstate"
    region  = "us-east-1"
    profile = "revature-terraform-state"
    encrypt = true
  }
}

# Data Block
data "aws_ami" "al2" {
  most_recent = true
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-ebs"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["amazon"]
}
