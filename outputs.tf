output "account" {
  description = "Object containing the SecurityHub account resource"
  value       = module.account.account
}

output "subscriptions" {
  description = "Object containing the SecurityHub subscriptions resources"
  value       = module.subscriptions
}

output "action_targets" {
  description = "Object containing the SecurityHub action targets resources"
  value       = module.action_targets
}
