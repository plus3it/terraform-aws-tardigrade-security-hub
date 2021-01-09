provider "aws" {
  region  = "us-east-1"
  profile = "resource-member"
}

provider "aws" {
  region  = "us-east-1"
  alias   = "resource-owner"
  profile = "resource-owner"
}

module "securityhub_owner" {
  source = "../../../"

  providers = {
    aws        = aws.resource-owner
    aws.master = aws.resource-owner
  }
}
