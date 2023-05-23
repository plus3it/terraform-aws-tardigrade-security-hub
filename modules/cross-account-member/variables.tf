variable "member_email" {
  description = "Email address associated with the member account. Required for the cross-account SecurityHub member invite workflow"
  type        = string
}

variable "action_targets" {
  description = "Schema list of SecurityHub action targets."
  type = list(object({
    name        = string
    description = string
    identifer   = string
  }))
  default = []
}

variable "control_finding_generator" {
  description = "(Optional) Updates whether the calling account has consolidated control findings turned on."
  type        = string
  default     = "SECURITY_CONTROL"
}

variable "product_subscription_arns" {
  description = "List of product arns to subscribe to. See https://www.terraform.io/docs/providers/aws/r/securityhub_product_subscription.html"
  type        = list(string)
  default     = []
}

variable "standard_subscription_arns" {
  description = "List of standard arns to subscribe to. See https://www.terraform.io/docs/providers/aws/r/securityhub_standards_subscription.html"
  type        = list(string)
  default     = []
}
