# terraform-aws-tardigrade-security-hub/subscriptions

<!-- BEGIN TFDOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.29.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3.29.0 |

## Resources

| Name | Type |
|------|------|

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_product_subscription_arns"></a> [product\_subscription\_arns](#input\_product\_subscription\_arns) | List of product arns to subscribe to. See https://www.terraform.io/docs/providers/aws/r/securityhub_product_subscription.html | `list(string)` | `[]` | no |
| <a name="input_standard_subscription_arns"></a> [standard\_subscription\_arns](#input\_standard\_subscription\_arns) | List of standard arns to subscribe to. See https://www.terraform.io/docs/providers/aws/r/securityhub_standards_subscription.html | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_product_subscriptions"></a> [product\_subscriptions](#output\_product\_subscriptions) | Object containing SecurityHub product subscription resources |
| <a name="output_standards_subscriptions"></a> [standards\_subscriptions](#output\_standards\_subscriptions) | Object containing SecurityHub standards subscription resources |

<!-- END TFDOCS -->
