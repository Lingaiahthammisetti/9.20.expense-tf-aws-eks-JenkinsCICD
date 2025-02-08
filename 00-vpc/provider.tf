terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.58.0"
    }
  }
backend "s3" {
  bucket = "terraform-aws-eks-remote-state" #bucketname created in aws
  key = "terraform-aws-eks-vpc" #key we can give any name but should be unique to application/project
  region = "us-east-1"
  dynamodb_table = "terraform-aws-eks-remote-state-locking" # Dynamo db table name in aws
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}

