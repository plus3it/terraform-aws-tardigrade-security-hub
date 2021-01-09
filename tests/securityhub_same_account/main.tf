provider "aws" {
  region  = "us-east-1"
  profile = "resource-owner"
}

provider "aws" {
  region  = "us-east-1"
  alias   = "resource-owner"
  profile = "resource-owner"
}

module "securityhub" {
  source = "../../"

  providers = {
    aws        = aws
    aws.master = aws.resource-owner
  }

  standard_subscription_arns = [
    "arn:aws:securityhub:::ruleset/cis-aws-foundations-benchmark/v/1.2.0",
    "arn:aws:securityhub:us-east-1::standards/pci-dss/v/3.2.1",
  ]

  product_subscription_arns = [
    "arn:aws:securityhub:us-east-1:453761072151:product/turbot/turbot",
  ]
}

output "securityhub" {
  value = module.securityhub
}
