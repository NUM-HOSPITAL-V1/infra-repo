terraform {
  required_version = ">= 1.5.0"

  backend "s3" {
    bucket         = "hospital-backend-tfstate-859449724739-eun1"
    key            = "hospital-backend/terraform.tfstate"
    region         = "eu-north-1"
    dynamodb_table = "hospital-backend-tf-locks"
  }

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
