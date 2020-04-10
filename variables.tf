variable "create_securityhub_member" {
  description = "Controls whether to create the GuardDuty member"
  type        = bool
  default     = true
}

variable "email_address" {
  description = "Email address associated with the member account. Required input for the SecurityHub member invitation."
  type        = string
  default     = null
}

variable "auto_accept" {
  description = "Controls whether to automatically accept the invitation"
  type        = bool
  default     = true
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

variable "profile" {
  description = "(Optional) Used by null_resource to establish botocore session"
  type        = string
  default     = ""
}

variable "role_arn" {
  description = "(Optional) Used by null_resource to assume a role in the accepter account"
  type        = string
  default     = ""
}

variable "region" {
  description = "(Optional) Used by null_resource to establish botocore client"
  type        = string
  default     = null
}
