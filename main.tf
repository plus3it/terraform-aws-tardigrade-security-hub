provider aws {
  alias = "master"
}

# Enable SecurityHub
module account {
  source = "./modules/account"
}

# Send invite from master
module member {
  source = "./modules/member"
  count  = local.cross_account ? 1 : 0
  providers = {
    aws = aws.master
  }

  account_id = data.aws_caller_identity.this.account_id
  email      = var.member_email

  depends_on = [
    module.account
  ]
}

# Accept invite
module accept {
  source = "./modules/accepter"
  count  = local.cross_account ? 1 : 0

  master_account_id = data.aws_caller_identity.master.account_id

  profile  = var.accepter_profile
  role_arn = var.accepter_role_arn
  region   = var.accepter_region

  depends_on = [
    module.member
  ]
}

# Manage subscriptions
module subscriptions {
  source = "./modules/subscriptions"

  standard_subscription_arns = var.standard_subscription_arns
  product_subscription_arns  = var.product_subscription_arns

  depends_on = [
    module.account
  ]
}

# Manage action targets
module action_targets {
  source   = "./modules/action_target"
  for_each = { for action_target in var.action_targets : action_target.name => action_target }

  name        = each.key
  description = each.value.description
  identifier  = each.value.identifier
}

locals {
  cross_account = data.aws_caller_identity.this.account_id != data.aws_caller_identity.master.account_id
}

data aws_caller_identity this {}

data aws_caller_identity master {
  provider = aws.master
}
