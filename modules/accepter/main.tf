resource null_resource accepter {
  provisioner local-exec {
    command = join(" ", local.create)
  }

  provisioner local-exec {
    when    = destroy
    command = self.triggers.destroy_command
  }

  provisioner local-exec {
    when    = destroy
    command = "python -c 'import time; time.sleep(5)'"
  }

  lifecycle {
    ignore_changes = [triggers["destroy_command"]]
  }

  triggers = {
    destroy_command = join(" ", local.destroy)
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
    "\"${var.master_account_id}\"",
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
    "\"${var.master_account_id}\"",
    "--remove-master",
    "--profile",
    "\"${var.profile}\"",
    "--role-arn",
    "\"${local.role_arn}\"",
    "--region",
    "\"${var.region}\"",
  ]
}
