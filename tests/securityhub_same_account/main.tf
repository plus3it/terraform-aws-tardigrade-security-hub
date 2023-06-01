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

  standards_controls = [
    {
      name                  = "cis-aws-foundations-benchmark"
      standards_control_arn = "arn:aws:securityhub:us-east-1:303523384066:control/cis-aws-foundations-benchmark/v/1.2.0/1.10"
      control_status        = "ENABLED"
      disabled_reason       = ""
    },
    {
      name                  = "pci-dss"
      standards_control_arn = "arn:aws:securityhub:us-east-1:303523384066:control/pci-dss/v/3.2.1/PCI.AutoScaling.1"
      control_status        = "DISABLED"
      disabled_reason       = "I don't like security"
    }
  ]
}

output "securityhub" {
  value = module.securityhub
}

