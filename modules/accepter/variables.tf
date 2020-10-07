variable master_account_id {
  description = "Account ID of the AWS SecurityHub master account that sent the invite"
  type        = string
}

variable profile {
  description = "Used by null_resource to establish botocore session"
  type        = string
}

variable role_arn {
  description = "Used by null_resource to assume a role in the accepter account"
  type        = string
}

variable region {
  description = "Used by null_resource to establish botocore client"
  type        = string
}
