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
| terraform | >= 0.12 |

## Providers

| Name | Version |
|------|---------|
| aws | n/a |
| aws.master | n/a |
| null | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| auto\_accept | Controls whether to automatically accept the invitation | `bool` | `true` | no |
| create\_securityhub\_member | Controls whether to create the GuardDuty member | `bool` | `true` | no |
| email\_address | Email address associated with the member account. Required input for the SecurityHub member invitation. | `string` | `null` | no |
| product\_subscription\_arns | List of product arns to subscribe to. See https://www.terraform.io/docs/providers/aws/r/securityhub_product_subscription.html | `list(string)` | `[]` | no |
| profile | (Optional) Used by null\_resource to establish botocore session | `string` | `""` | no |
| region | (Optional) Used by null\_resource to establish botocore client | `string` | `""` | no |
| role\_arn | (Optional) Used by null\_resource to assume a role in the accepter account | `string` | `""` | no |
| standard\_subscription\_arns | List of standard arns to subscribe to. See https://www.terraform.io/docs/providers/aws/r/securityhub_standards_subscription.html | `list(string)` | `[]` | no |

## Outputs

No output.

<!-- END TFDOCS -->
