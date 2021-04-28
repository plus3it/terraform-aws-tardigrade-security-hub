provider "aws" {
  alias = "administrator"
}

# Enables/configures Security Hub in member account
module "account" {
  source = "../../"

  action_targets             = var.action_targets
  product_subscription_arns  = var.product_subscription_arns
  standard_subscription_arns = var.standard_subscription_arns
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

  master_account_id = data.aws_caller_identity.administrator.account_id

  depends_on = [
    module.member
  ]
}

data "aws_caller_identity" "administrator" {
  provider = aws.administrator
}
