variable "standards_control_arn" {
  description = "The standards control ARN"
  type        = string
}

variable "control_status" {
  description = "Control status enabled or disabled"
  type        = string
}

variable "disabled_reason" {
  description = "A description of the reason why you are disabling a security standard control"
  type        = string
}
