# Enables/configures Security Hub in member account
module "account" {
  source = "../../"

  security_hub = var.security_hub
}

resource "aws_securityhub_member" "this" {
  provider = aws.administrator

  account_id = module.account.account.id
  email      = var.security_hub.member_email
  invite     = true
}

resource "aws_securityhub_invite_accepter" "this" {
  master_id = terraform_data.accepter_dependencies.input.master_id
}

# Creates dependency on `module.account.account.id`, so security hub is enabled
# in the account before the invite can be accepted
resource "terraform_data" "accepter_dependencies" {
  input = {
    master_id  = coalesce(var.security_hub.master_id, aws_securityhub_member.this.master_id)
    account_id = module.account.account.id
  }
}
