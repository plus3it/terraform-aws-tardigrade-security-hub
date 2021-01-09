output "standards_subscriptions" {
  description = "Object containing SecurityHub standards subscription resources"
  value       = aws_securityhub_standards_subscription.this
}

output "product_subscriptions" {
  description = "Object containing SecurityHub product subscription resources"
  value       = aws_securityhub_product_subscription.this
}
