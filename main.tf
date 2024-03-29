# Enable SecurityHub
module "account" {
  source = "./modules/account"

  auto_enable_controls      = var.auto_enable_controls
  control_finding_generator = var.control_finding_generator
  enable_default_standards  = var.enable_default_standards
}

# Manage subscriptions
module "subscriptions" {
  source = "./modules/subscriptions"

  standard_subscription_arns = var.standard_subscription_arns
  product_subscription_arns  = var.product_subscription_arns

  depends_on = [
    module.account
  ]
}

# Manage Control status
module "standards_controls" {
  source   = "./modules/standards_controls"
  for_each = { for control in var.standards_controls : control.name => control }

  standards_control_arn = each.value.standards_control_arn
  control_status        = each.value.control_status
  disabled_reason       = each.value.disabled_reason


  depends_on = [
    module.account,
    module.subscriptions
  ]
}

# Manage action targets
module "action_targets" {
  source   = "./modules/action_target"
  for_each = { for action_target in var.action_targets : action_target.name => action_target }

  name        = each.key
  description = each.value.description
  identifier  = each.value.identifier
}
