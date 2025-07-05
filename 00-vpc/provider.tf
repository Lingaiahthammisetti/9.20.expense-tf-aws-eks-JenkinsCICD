terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.58.0"
    }
  }
backend "s3" {
  bucket = "tf-aws-eks-remote-state"
  key = "tf-aws-eks-cicd-vpc"
  region = "us-east-1"
  dynamodb_table = "tf-aws-eks-locking"
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}

