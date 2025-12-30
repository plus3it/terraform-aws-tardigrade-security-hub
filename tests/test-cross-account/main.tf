# Provider to use as the securityhub member (aka invitee)
provider "aws" {
  profile = "aws" # Profile must exist in your .aws/config
}

# Provider to use as the securityhub administrator
provider "aws" {
  alias   = "administrator"
  profile = "awsalternate" # Profile must exist in your .aws/config
}

# Enables/configures Security Hub in administrator account
module "securityhub_owner" {
  source = "../../"

  providers = {
    aws = aws.administrator
  }
}

module "security_hub" {
  source = "../../modules/cross-account-member"

  providers = {
    aws.administrator = aws.administrator
  }

  security_hub = {
    member_email = var.member_email
    master_id    = module.securityhub_owner.account.id

    auto_enable_controls      = true
    control_finding_generator = null # "SECURITY_CONTROL|STANDARD_CONTROL"
    enable_default_standards  = true # Enables CIS AWS Foundations and AWS Foundational Security Best Practices

    standard_subscription_arns = [
      "arn:${local.partition}:securityhub:${local.region}::standards/aws-resource-tagging-standard/v/1.0.0",
      "arn:${local.partition}:securityhub:${local.region}::standards/pci-dss/v/3.2.1",
    ]

    product_subscription_arns = [
      "arn:${local.partition}:securityhub:${local.region}:453761072151:product/turbot/turbot",
    ]

    standards_control_associations = [
      {
        name                = "cis-foundations-cloudtrail-2"
        association_status  = "DISABLED"
        security_control_id = "CloudTrail.2"
        updated_reason      = "I don't like security"
        standards_arn       = "arn:${local.partition}:securityhub:::ruleset/cis-aws-foundations-benchmark/v/1.2.0"
      },
      {
        name                = "aws-foundations-cloudtrail-2"
        association_status  = "DISABLED"
        security_control_id = "CloudTrail.2"
        updated_reason      = "I don't like security"
        standards_arn       = "arn:${local.partition}:securityhub:${local.region}::standards/aws-foundational-security-best-practices/v/1.0.0"
      },
      {
        name                = "pci-dss-cloudtrail-2"
        association_status  = "DISABLED"
        security_control_id = "CloudTrail.2"
        updated_reason      = "I don't like security"
        standards_arn       = "arn:${local.partition}:securityhub:${local.region}::standards/pci-dss/v/3.2.1"
      },
    ]
  }
}

locals {
  partition = data.aws_partition.current.partition
  region    = data.aws_region.current.region
}

data "aws_partition" "current" {}
data "aws_region" "current" {}
