# terraform-aws-tardigrade-security-hub/accepter

<!-- BEGIN TFDOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| null | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| master\_account\_id | Account ID of the AWS SecurityHub master account that sent the invite | `string` | n/a | yes |
| profile | Used by null\_resource to establish botocore session | `string` | n/a | yes |
| region | Used by null\_resource to establish botocore client | `string` | n/a | yes |
| role\_arn | Used by null\_resource to assume a role in the accepter account | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| accepter | Object containing SecurityHub accepter (null) resource |

<!-- END TFDOCS -->
