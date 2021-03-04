resource "aws_securityhub_member" "this" {
  account_id = var.account_id
  email      = var.email
  invite     = true
}
