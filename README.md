# terraform-aws-tardigrade-security-hub
Terraform module to enable and configure SecurityHub. The module supports independent
accounts with the top-level module, and the cross-account invite/accept workflow with
the `modules/cross-account-member` module.

## Testing
You can find example implementations of this module in the tests folder. This module
requires 2 different AWS accounts to test and so the terraform aws provider definitions
are assuming that you will be using a profile with the name `aws` and `awsalternate`.

Note: the implementation `tests/test-cross-account` will require you to provide the variable
`email_address`.

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

## Resources

| Name | Type |
|------|------|
| [aws_partition.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/partition) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_security_hub"></a> [security\_hub](#input\_security\_hub) | Object of inputs for Security Hub configuration | <pre>object({<br/>    auto_enable_controls      = optional(bool, true)<br/>    control_finding_generator = optional(string)<br/>    enable_default_standards  = optional(bool, true)<br/><br/>    product_subscription_arns  = optional(list(string), [])<br/>    standard_subscription_arns = optional(list(string), [])<br/><br/>    action_targets = optional(list(object({<br/>      name        = string<br/>      description = string<br/>      identifier  = string<br/>    })), [])<br/><br/>    standards_control_associations = optional(list(object({<br/>      name                = string<br/>      association_status  = string<br/>      security_control_id = string<br/>      standards_arn       = string<br/>      updated_reason      = optional(string)<br/>    })), [])<br/>  })</pre> | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_account"></a> [account](#output\_account) | Object of the Security Hub account resource |
| <a name="output_action_targets"></a> [action\_targets](#output\_action\_targets) | Map of Security Hub action targets |
| <a name="output_product_subscriptions"></a> [product\_subscriptions](#output\_product\_subscriptions) | Map of Security Hub Product Subscriptions |
| <a name="output_standards_control_associations"></a> [standards\_control\_associations](#output\_standards\_control\_associations) | Map of Security Hub Standards Control Associations |
| <a name="output_standards_subscriptions"></a> [standards\_subscriptions](#output\_standards\_subscriptions) | Map of Security Hub Standards Subscriptions |

<!-- END TFDOCS -->
