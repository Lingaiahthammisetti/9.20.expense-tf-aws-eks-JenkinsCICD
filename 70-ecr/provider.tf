terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

backend "s3" {
  bucket = "terraform-aws-eks-remote-state"
  key = "terraform-aws-eks-ecr"
  region = "us-east-1"
  dynamodb_table = "terraform-aws-eks-remote-state-locking"
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}

