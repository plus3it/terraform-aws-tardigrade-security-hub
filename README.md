# terraform-aws-tardigrade-security-hub
Terraform module to enable SecurityHub in a child account and link it
to a pre-existing SecurityHub instance in the parent account

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
| terraform | >= 0.13 |

## Providers

| Name | Version |
|------|---------|
| aws | n/a |
| aws.master | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| accepter\_profile | (Optional) Used by null\_resource accepter to establish botocore session. Required for the cross-account SecurityHub member accept workflow | `string` | `""` | no |
| accepter\_region | (Optional) Used by null\_resource accepter to establish botocore client. Required for the cross-account SecurityHub member accept workflow | `string` | `""` | no |
| accepter\_role\_arn | (Optional) Used by null\_resource accepter to assume a role in the accepter account. Required for the cross-account SecurityHub member accept workflow | `string` | `""` | no |
| action\_targets | Schema list of SecurityHub action targets. | <pre>list(object({<br>    name        = string<br>    description = string<br>    identifer   = string<br>  }))</pre> | `[]` | no |
| member\_email | (Optional) Email address associated with the member account. Required for the cross-account SecurityHub member invite workflow | `string` | `null` | no |
| product\_subscription\_arns | List of product arns to subscribe to. See https://www.terraform.io/docs/providers/aws/r/securityhub_product_subscription.html | `list(string)` | `[]` | no |
| standard\_subscription\_arns | List of standard arns to subscribe to. See https://www.terraform.io/docs/providers/aws/r/securityhub_standards_subscription.html | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| accept | Object containing the SecurityHub (null) accepter resource |
| account | Object containing the SecurityHub account resource |
| action\_targets | Object containing the SecurityHub action targets resources |
| member | Object containing the SecurityHub member resource |
| subscriptions | Object containing the SecurityHub subscriptions resources |

<!-- END TFDOCS -->
