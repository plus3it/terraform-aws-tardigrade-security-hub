# Enables/configures Security Hub in administrator account
module "securityhub_owner" {
  source = "../../"
}

# Enables/configures Security Hub in member account
module "account" {
  source = "../../"

  providers = {
    aws = aws.invitee
  }

  action_targets             = var.action_targets
  product_subscription_arns  = var.product_subscription_arns
  standard_subscription_arns = var.standard_subscription_arns
}

# Send invite from administrator account
module "member" {
  source = "../member"

  depends_on = [module.securityhub_owner]

  account_id = module.account.account.id
  email      = var.member_email
}

# Accept invite
module "accept" {
  source = "../accepter"

  depends_on = [module.account]

  providers = {
    aws = aws.invitee
  }

  master_account_id = module.member.member.master_id
}
