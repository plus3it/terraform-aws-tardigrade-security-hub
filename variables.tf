variable "action_targets" {
  description = "Schema list of SecurityHub action targets."
  type = list(object({
    name        = string
    description = string
    identifer   = string
  }))
  default = []
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

variable "control_finding_generator" {
  description = "(Optional) Updates whether the calling account has consolidated control findings turned on."
  type        = string
  default     = "SECURITY_CONTROL"
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
