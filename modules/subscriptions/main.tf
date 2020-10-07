resource aws_securityhub_standards_subscription this {
  for_each = toset(var.standard_subscription_arns)

  standards_arn = each.value
}

resource aws_securityhub_product_subscription this {
  for_each = toset(var.product_subscription_arns)

  product_arn = each.value
}
