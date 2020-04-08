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

  create_securityhub_member = false
  region                    = "us-east-1"
}
