provider "aws" {}

provider "aws" {
  alias = "master"
}

data "aws_caller_identity" "member" {
}

data "aws_caller_identity" "master" {
  provider = aws.master
}

# Create SecurityHub member
resource "aws_securityhub_account" "this" {
  count = var.create_securityhub_member ? 1 : 0

  provider = aws
}

# Send invitation to member from the master
resource "aws_securityhub_member" "this" {
  count = var.create_securityhub_member ? 1 : 0

  provider   = aws.master
  depends_on = [aws_securityhub_account.this]

  account_id = data.aws_caller_identity.member.account_id
  email      = var.email_address
  invite     = true
}

# Subscribe to the AWS provided subscriptions
locals {
  standard_arns = var.create_securityhub_member ? toset(var.standard_subscription_arns) : toset([])
}

resource "aws_securityhub_standards_subscription" "this" {
  for_each = local.standard_arns

  provider   = aws
  depends_on = [aws_securityhub_account.this]

  standards_arn = each.value
}

# Subscribe to various products
locals {
  product_arns = var.create_securityhub_member ? toset(var.product_subscription_arns) : toset([])
}

resource "aws_securityhub_product_subscription" "this" {
  for_each = local.product_arns

  provider   = aws
  depends_on = [aws_securityhub_account.this]

  product_arn = each.value
}

resource "null_resource" "create" {
  count = var.create_securityhub_member && var.auto_accept ? 1 : 0

  # The invite from the master sometimes takes a few seconds to register
  # before it can be accepted in the target account, so we pause for 5 seconds to let
  # the invite propagate
  provisioner "local-exec" {
    command = "python -c 'import time; time.sleep(5)'"
  }

  provisioner "local-exec" {
    command = join(" ", local.create)
  }

  triggers = {
    destroy_command = join(" ", local.destroy)
  }

  provisioner "local-exec" {
    when    = destroy
    command = self.triggers.destroy_command
  }

  provisioner "local-exec" {
    when    = destroy
    command = "python -c 'import time; time.sleep(5)'"
  }

  lifecycle {
    ignore_changes = [triggers["destroy_command"]]
  }
}

locals {
  # Replace a terraform-aws-provider sts assumed role with the equivalent iam role, i.e:
  #     arn:aws:sts::<account-id>:assumed-role/<role-name>/<numeric-session-id>
  # =>
  #     arn:aws:iam::<account-id>:role/<role-name>
  # This allows a user to simply pass `role_arn = "${data.aws_caller_identity.this.arn}"`
  role_arn = replace(
    var.role_arn,
    "/(.*):sts:(.*):assumed-role/(.*)/[0-9]*$/",
    "$1:iam:$2:role/$3",
  )

  create = [
    "python",
    "\"${path.module}/security_hub_accepter.py\"",
    "--master-account-id",
    "\"${data.aws_caller_identity.master.account_id}\"",
    "--profile",
    "\"${var.profile}\"",
    "--role-arn",
    "\"${local.role_arn}\"",
    "--region",
    "\"${var.region}\"",
  ]

  destroy = [
    "python",
    "\"${path.module}/security_hub_accepter.py\"",
    "--master-account-id",
    "\"${data.aws_caller_identity.master.account_id}\"",
    "--remove-master",
    "--profile",
    "\"${var.profile}\"",
    "--role-arn",
    "\"${local.role_arn}\"",
    "--region",
    "\"${var.region}\"",
  ]
}
