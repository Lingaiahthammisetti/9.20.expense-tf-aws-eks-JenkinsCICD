terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = ">= 5.92.0"
    }
  }

backend "s3" {
  bucket = "tf-aws-eks-remote-state"
  key = "tf-aws-eks-cicd-ingress-alb"
  region = "us-east-1"
  dynamodb_table = "tf-aws-eks-locking"
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}