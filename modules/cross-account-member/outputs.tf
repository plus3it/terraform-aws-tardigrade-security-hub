output "account" {
  description = "Object containing the SecurityHub resources"
  value       = module.account
}

output "member" {
  description = "Object containing the SecurityHub member resource"
  value       = aws_securityhub_member.this
}

output "accepter" {
  description = "Object containing the SecurityHub accepter resource"
  value       = aws_securityhub_invite_accepter.this
}
