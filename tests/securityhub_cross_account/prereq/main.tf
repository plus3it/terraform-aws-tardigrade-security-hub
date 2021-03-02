provider "aws" {
  region  = "us-east-1"
  profile = "resource-owner"
}

module "securityhub_owner" {
  source = "../../../"
}
