provider "aws" {
  profile = "aws" # Profile must exist in your .aws/config
}

module "securityhub" {
  source = "../../"

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
