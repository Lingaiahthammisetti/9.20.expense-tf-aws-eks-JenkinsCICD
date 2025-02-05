terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.58.0"
    }
  }
backend "s3" {
  bucket = "terraform-aws-eks-remote-state"
  key = "terraform-aws-eks-bastion"
  region = "us-east-1"
  dynamodb_table = "terraform-aws-eks-remote-state-locking"
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}

