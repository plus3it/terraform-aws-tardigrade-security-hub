variable "action_targets" {
  description = "Schema list of SecurityHub action targets."
  type = list(object({
    name        = string
    description = string
    identifer   = string
  }))
  default = []
}

variable "standard_subscription_arns" {
  description = "List of standard arns to subscribe to. See https://www.terraform.io/docs/providers/aws/r/securityhub_standards_subscription.html"
  type        = list(string)
  default     = []
}

variable "product_subscription_arns" {
  description = "List of product arns to subscribe to. See https://www.terraform.io/docs/providers/aws/r/securityhub_product_subscription.html"
  type        = list(string)
  default     = []
}

variable "member_email" {
  description = "(Optional) Email address associated with the member account. Required for the cross-account SecurityHub member invite workflow"
  type        = string
  default     = null
}

variable "accepter_profile" {
  description = "(Optional) Used by null_resource accepter to establish botocore session. Required for the cross-account SecurityHub member accept workflow"
  type        = string
  default     = ""
}

variable "accepter_role_arn" {
  description = "(Optional) Used by null_resource accepter to assume a role in the accepter account. Required for the cross-account SecurityHub member accept workflow"
  type        = string
  default     = ""
}

variable "accepter_region" {
  description = "(Optional) Used by null_resource accepter to establish botocore client. Required for the cross-account SecurityHub member accept workflow"
  type        = string
  default     = ""
}
