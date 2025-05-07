# terraform-aws-tardigrade-security-hub/cross-account-member

<!-- BEGIN TFDOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.70.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 5.70.0 |
| <a name="provider_aws.administrator"></a> [aws.administrator](#provider\_aws.administrator) | >= 5.70.0 |
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Resources

| Name | Type |
|------|------|

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_security_hub"></a> [security\_hub](#input\_security\_hub) | Object of inputs for Security Hub configuration | <pre>object({<br/>    member_email = string<br/>    master_id    = optional(string)<br/><br/>    auto_enable_controls      = optional(bool, true)<br/>    control_finding_generator = optional(string)<br/>    enable_default_standards  = optional(bool, true)<br/><br/>    product_subscription_arns  = optional(list(string), [])<br/>    standard_subscription_arns = optional(list(string), [])<br/><br/>    action_targets = optional(list(object({<br/>      name        = string<br/>      description = string<br/>      identifier  = string<br/>    })), [])<br/><br/>    standards_control_associations = optional(list(object({<br/>      name                = string<br/>      association_status  = string<br/>      security_control_id = string<br/>      standards_arn       = string<br/>      updated_reason      = optional(string)<br/>    })), [])<br/>  })</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_accepter"></a> [accepter](#output\_accepter) | Object containing the SecurityHub accepter resource |
| <a name="output_account"></a> [account](#output\_account) | Object containing the SecurityHub resources |
| <a name="output_member"></a> [member](#output\_member) | Object containing the SecurityHub member resource |

<!-- END TFDOCS -->
