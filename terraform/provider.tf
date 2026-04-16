terraform {
  required_version = ">= 1.5.0"

  # backend "s3" {
  #   bucket         = "hospital-tfstate-NEW_ACCOUNT_ID-use1"
  #   key            = "hospital/terraform.tfstate"
  #   region         = "us-east-1"
  #   dynamodb_table = "hospital-tf-locks"
  # }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}
