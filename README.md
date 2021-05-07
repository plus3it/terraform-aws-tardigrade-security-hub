# terraform-aws-tardigrade-security-hub
Terraform module to enable and configure SecurityHub. The module supports independent
accounts with the top-level module, and the cross-account invite/accept workflow with
the `modules/cross-account-member` module.

## Testing
You can find example implementations of this module in the tests folder. This module
requires 2 different AWS accounts to test and so the terraform aws provider definitions
are assuming that you will be using a profile with the name `resource-owner` and `resource-member`.

Note: the implementation `tests/create_securityhub_member` will require you to provide the variables
`email_address` prior to use

<!-- BEGIN TFDOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.29.0 |

## Providers

No providers.

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_action_targets"></a> [action\_targets](#input\_action\_targets) | Schema list of SecurityHub action targets. | <pre>list(object({<br>    name        = string<br>    description = string<br>    identifer   = string<br>  }))</pre> | `[]` | no |
| <a name="input_product_subscription_arns"></a> [product\_subscription\_arns](#input\_product\_subscription\_arns) | List of product arns to subscribe to. See https://www.terraform.io/docs/providers/aws/r/securityhub_product_subscription.html | `list(string)` | `[]` | no |
| <a name="input_standard_subscription_arns"></a> [standard\_subscription\_arns](#input\_standard\_subscription\_arns) | List of standard arns to subscribe to. See https://www.terraform.io/docs/providers/aws/r/securityhub_standards_subscription.html | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_account"></a> [account](#output\_account) | Object containing the SecurityHub account resource |
| <a name="output_action_targets"></a> [action\_targets](#output\_action\_targets) | Object containing the SecurityHub action targets resources |
| <a name="output_subscriptions"></a> [subscriptions](#output\_subscriptions) | Object containing the SecurityHub subscriptions resources |

<!-- END TFDOCS -->
