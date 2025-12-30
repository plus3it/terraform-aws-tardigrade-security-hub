resource "aws_securityhub_account" "this" {
  auto_enable_controls      = var.security_hub.auto_enable_controls
  control_finding_generator = var.security_hub.control_finding_generator

  # Set to `false` and instead use `aws_securityhub_standards_subscription` to
  # enable default standards. This ensures the standards_arn will always be present,
  # so it can be used in the `aws_securityhub_standards_control_association` resource
  # to create the dependency on the subscription.
  enable_default_standards = false
}

resource "aws_securityhub_action_target" "this" {
  for_each = { for action_target in var.security_hub.action_targets : action_target.name => action_target }

  name        = each.value.name
  identifier  = each.value.identifier
  description = each.value.description

  depends_on = [
    aws_securityhub_account.this,
  ]
}

resource "aws_securityhub_product_subscription" "this" {
  for_each = toset(var.security_hub.product_subscription_arns)

  product_arn = each.value

  depends_on = [
    aws_securityhub_account.this,
  ]
}

resource "aws_securityhub_standards_subscription" "this" {
  for_each = toset(local.standards_subscription_arns)

  standards_arn = each.value

  depends_on = [
    aws_securityhub_account.this,
  ]
}

resource "aws_securityhub_standards_control_association" "this" {
  for_each = { for association in var.security_hub.standards_control_associations : association.name => association }

  standards_arn       = aws_securityhub_standards_subscription.this[each.value.standards_arn].standards_arn
  security_control_id = each.value.security_control_id
  association_status  = each.value.association_status
  updated_reason      = each.value.updated_reason
}

locals {
  standards_subscription_arns = flatten([
    var.security_hub.enable_default_standards ? local.default_standards_arns : [],
    var.security_hub.standard_subscription_arns,
  ])

  default_standards_arns = [
    "arn:${local.partition}:securityhub:${local.region}::standards/aws-foundational-security-best-practices/v/1.0.0",
    "arn:${local.partition}:securityhub:::ruleset/cis-aws-foundations-benchmark/v/1.2.0",
  ]

  partition = data.aws_partition.current.partition
  region    = data.aws_region.current.region
}

data "aws_partition" "current" {}
data "aws_region" "current" {}
