terraform {
  required_version = "~> 0.12.0"

  backend "s3" {
    acl     = "bucket-owner-full-control"
    bucket  = "tf-state-cdcloudlogix"
    encrypt = true
    key     = "lambda_s3_public.tfstate"
    region  = "eu-west-1"
  }
}

provider "aws" {
  region  = "eu-west-1"
  version = "~> 2.6"
}
