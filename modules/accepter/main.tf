resource "aws_securityhub_invite_accepter" "this" {
  master_id = var.master_account_id
}
