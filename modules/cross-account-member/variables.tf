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

variable "auto_enable_controls" {
  description = "Boolean that enables the security standards that Security Hub has designated as automatically enabled including: `AWS Foundational Security Best Practices v1.0.0` and `CIS AWS Foundations Benchmark v1.2.0`"
  type        = bool
  default     = true
}

variable "control_finding_generator" {
  description = "Manages whether the account reports consolidated control findings, or generates separate findings for every enabled standard."
  type        = string
  default     = "SECURITY_CONTROL"
}

variable "enable_default_standards" {
  description = "Boolean that automatically enables new controls when they are added to standards that are enabled"
  type        = bool
  default     = true
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

variable "standards_controls" {
  description = "List of Security Hub standards to enable or disable in current region."
  type = list(object({
    name                  = string
    standards_control_arn = string
    control_status        = string
    disabled_reason       = string
  }))
  default = []
}
