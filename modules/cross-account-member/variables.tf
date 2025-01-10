variable "security_hub" {
  description = "Object of inputs for Security Hub configuration"
  nullable    = false
  type = object({
    member_email = string
    master_id    = optional(string)

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
}
