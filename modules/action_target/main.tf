resource "aws_securityhub_action_target" "this" {
  name        = var.name
  identifier  = var.identifier
  description = var.description
}
