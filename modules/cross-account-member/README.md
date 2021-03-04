# terraform-aws-tardigrade-security-hub/cross-account-member

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
| aws.administrator | >= 3.29.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| member\_email | Email address associated with the member account. Required for the cross-account SecurityHub member invite workflow | `string` | n/a | yes |
| action\_targets | Schema list of SecurityHub action targets. | <pre>list(object({<br>    name        = string<br>    description = string<br>    identifer   = string<br>  }))</pre> | `[]` | no |
| product\_subscription\_arns | List of product arns to subscribe to. See https://www.terraform.io/docs/providers/aws/r/securityhub_product_subscription.html | `list(string)` | `[]` | no |
| standard\_subscription\_arns | List of standard arns to subscribe to. See https://www.terraform.io/docs/providers/aws/r/securityhub_standards_subscription.html | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| accepter | Object containing the SecurityHub accepter resource |
| account | Object containing the SecurityHub account resource |
| action\_targets | Object containing the SecurityHub action targets resources |
| member | Object containing the SecurityHub member resource |
| subscriptions | Object containing the SecurityHub subscriptions resources |

<!-- END TFDOCS -->
