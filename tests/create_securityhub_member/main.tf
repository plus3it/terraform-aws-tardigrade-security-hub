provider aws {
  region  = "us-east-1"
  profile = "resource-member"
}

provider aws {
  region  = "us-east-1"
  alias   = "resource-owner"
  profile = "resource-owner"
}

module "create_securityhub_member" {
  source = "../../"

  providers = {
    aws        = aws
    aws.master = aws.resource-owner
  }

  create_securityhub_member  = true
  email_address              = var.email_address
  region                     = "us-east-1"
  standard_subscription_arns = var.standard_subscription_arns
  product_subscription_arns  = var.product_subscription_arns
}
