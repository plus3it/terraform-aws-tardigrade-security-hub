output "account" {
  description = "Object of the Security Hub account resource"
  value       = aws_securityhub_account.this
}

output "action_targets" {
  description = "Map of Security Hub action targets"
  value       = aws_securityhub_action_target.this
}

output "product_subscriptions" {
  description = "Map of Security Hub Product Subscriptions"
  value       = aws_securityhub_product_subscription.this
}

output "standards_subscriptions" {
  description = "Map of Security Hub Standards Subscriptions"
  value       = aws_securityhub_standards_subscription.this
}

output "standards_control_associations" {
  description = "Map of Security Hub Standards Control Associations"
  value       = aws_securityhub_standards_control_association.this
}
