# terraform-aws-tardigrade-security-hub/subscriptions

<!-- BEGIN TFDOCS -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13 |
| aws | >= 3.29.0 |

## Providers

| Name | Version |
|------|---------|
| aws | >= 3.29.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| product\_subscription\_arns | List of product arns to subscribe to. See https://www.terraform.io/docs/providers/aws/r/securityhub_product_subscription.html | `list(string)` | `[]` | no |
| standard\_subscription\_arns | List of standard arns to subscribe to. See https://www.terraform.io/docs/providers/aws/r/securityhub_standards_subscription.html | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| product\_subscriptions | Object containing SecurityHub product subscription resources |
| standards\_subscriptions | Object containing SecurityHub standards subscription resources |

<!-- END TFDOCS -->
