# terraform-aws-tardigrade-security-hub/cross-account-member

<!-- BEGIN TFDOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.64.0 |

## Providers

No providers.

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_member_email"></a> [member\_email](#input\_member\_email) | Email address associated with the member account. Required for the cross-account SecurityHub member invite workflow | `string` | n/a | yes |
| <a name="input_action_targets"></a> [action\_targets](#input\_action\_targets) | Schema list of SecurityHub action targets. | <pre>list(object({<br>    name        = string<br>    description = string<br>    identifer   = string<br>  }))</pre> | `[]` | no |
| <a name="input_auto_enable_controls"></a> [auto\_enable\_controls](#input\_auto\_enable\_controls) | Boolean that enables the security standards that Security Hub has designated as automatically enabled including: `AWS Foundational Security Best Practices v1.0.0` and `CIS AWS Foundations Benchmark v1.2.0` | `bool` | `true` | no |
| <a name="input_control_finding_generator"></a> [control\_finding\_generator](#input\_control\_finding\_generator) | Manages whether the account reports consolidated control findings, or generates separate findings for every enabled standard. | `string` | `"SECURITY_CONTROL"` | no |
| <a name="input_enable_default_standards"></a> [enable\_default\_standards](#input\_enable\_default\_standards) | Boolean that automatically enables new controls when they are added to standards that are enabled | `bool` | `true` | no |
| <a name="input_product_subscription_arns"></a> [product\_subscription\_arns](#input\_product\_subscription\_arns) | List of product arns to subscribe to. See https://www.terraform.io/docs/providers/aws/r/securityhub_product_subscription.html | `list(string)` | `[]` | no |
| <a name="input_standard_subscription_arns"></a> [standard\_subscription\_arns](#input\_standard\_subscription\_arns) | List of standard arns to subscribe to. See https://www.terraform.io/docs/providers/aws/r/securityhub_standards_subscription.html | `list(string)` | `[]` | no |
| <a name="input_standards_controls"></a> [standards\_controls](#input\_standards\_controls) | List of Security Hub standards to enable or disable in current region. | <pre>list(object({<br>    name                  = string<br>    standards_control_arn = string<br>    control_status        = string<br>    disabled_reason       = string<br>  }))</pre> | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_accepter"></a> [accepter](#output\_accepter) | Object containing the SecurityHub accepter resource |
| <a name="output_account"></a> [account](#output\_account) | Object containing the SecurityHub account resource |
| <a name="output_action_targets"></a> [action\_targets](#output\_action\_targets) | Object containing the SecurityHub action targets resources |
| <a name="output_member"></a> [member](#output\_member) | Object containing the SecurityHub member resource |
| <a name="output_subscriptions"></a> [subscriptions](#output\_subscriptions) | Object containing the SecurityHub subscriptions resources |

<!-- END TFDOCS -->
