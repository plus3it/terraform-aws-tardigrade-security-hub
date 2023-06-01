# Enables/configures Security Hub in member account
module "account" {
  source = "../../"

  action_targets             = var.action_targets
  control_finding_generator  = var.control_finding_generator
  product_subscription_arns  = var.product_subscription_arns
  standard_subscription_arns = var.standard_subscription_arns
  standards_controls         = var.standards_controls
}

# Send invite from administrator account
module "member" {
  source = "../member"

  providers = {
    aws = aws.administrator
  }

  account_id = module.account.account.id
  email      = var.member_email
}

# Accept invite
module "accept" {
  source = "../accepter"

  depends_on = [module.account]

  master_account_id = module.member.member.master_id
}
