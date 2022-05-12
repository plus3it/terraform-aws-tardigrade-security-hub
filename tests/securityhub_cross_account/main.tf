# Provider to use as the securityhub member (aka invitee)
provider "aws" {
  region  = "us-east-1"
  alias   = "invitee"
  profile = "aws" # Profile must exist in your .aws/config
}

# Provider to use as the securityhub administrator
provider "aws" {
  region  = "us-east-1"
  profile = "awsalternate" # Profile must exist in your .aws/config
}

module "securityhub" {
  source = "../../modules/cross-account-member"

  providers = {
    aws.invitee = aws.invitee
  }

  member_email = var.member_email

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
