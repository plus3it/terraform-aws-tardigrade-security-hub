output "account" {
  description = "Object containing the SecurityHub account resource"
  value       = module.account.account
}

output "member" {
  description = "Object containing the SecurityHub member resource"
  value       = local.cross_account ? module.member[0].member : null
}

output "accept" {
  description = "Object containing the SecurityHub (null) accepter resource"
  value       = local.cross_account ? module.accept[0].accepter : null
}

output "subscriptions" {
  description = "Object containing the SecurityHub subscriptions resources"
  value       = module.subscriptions
}

output "action_targets" {
  description = "Object containing the SecurityHub action targets resources"
  value       = module.action_targets
}
