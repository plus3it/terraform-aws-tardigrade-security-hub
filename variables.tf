variable "security_hub" {
  description = "Object of inputs for Security Hub configuration"
  nullable    = false
  type = object({
    auto_enable_controls      = optional(bool, true)
    control_finding_generator = optional(string)
    enable_default_standards  = optional(bool, true)

    product_subscription_arns  = optional(list(string), [])
    standard_subscription_arns = optional(list(string), [])

    action_targets = optional(list(object({
      name        = string
      description = string
      identifier  = string
    })), [])

    standards_control_associations = optional(list(object({
      name                = string
      association_status  = string
      security_control_id = string
      standards_arn       = string
      updated_reason      = optional(string)
    })), [])
  })
  default = {}

  validation {
    condition = anytrue([
      var.security_hub.control_finding_generator == null,
      contains(["SECURITY_CONTROL", "STANDARD_CONTROL"], format("%v", var.security_hub.control_finding_generator)),
    ])
    error_message = format(
      "Expected `control_finding_generator` to be one of [\"STANDARD_CONTROL\", \"SECURITY_CONTROL\"], got %v.",
      var.security_hub.control_finding_generator
    )
  }
}
