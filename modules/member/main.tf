resource aws_securityhub_member this {
  account_id = var.account_id
  email      = var.email
  invite     = true

  # The invite sometimes takes a few seconds to register before it can be accepted in the target account,
  # so we pause for 5 seconds to let the invite propagate
  provisioner local-exec {
    command = "python -c 'import time; time.sleep(5)'"
  }
}
