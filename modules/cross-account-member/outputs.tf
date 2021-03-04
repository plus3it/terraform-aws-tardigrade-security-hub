output "account" {
  description = "Object containing the SecurityHub account resource"
  value       = module.account.account
}

output "member" {
  description = "Object containing the SecurityHub member resource"
  value       = module.member.member
}

output "accepter" {
  description = "Object containing the SecurityHub accepter resource"
  value       = module.accept.accepter
}

output "subscriptions" {
  description = "Object containing the SecurityHub subscriptions resources"
  value       = module.account.subscriptions
}

output "action_targets" {
  description = "Object containing the SecurityHub action targets resources"
  value       = module.account.action_targets
}
