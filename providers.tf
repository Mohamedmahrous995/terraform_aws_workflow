terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0.0"
    }
  }
}

provider "aws" {
  region = var.region
}

# terraform {
#   backend "s3" {
#     encrypt = true
#     # bucket         = "var.bucket_name"
#     # dynamodb_table = "var.dynamodb_tb_name"
#     # key            = "var.object_name"
#     bucket         = "tereraformworkspaceremote123456kn789"
#     key            = "terraform.tfstate"
#     dynamodb_table = "terraform-state-lock-dynamo"
#     region         = "us-east-1"
#   }
# }