# terraform-aws-tardigrade-security-hub/member

<!-- BEGIN TFDOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| account\_id | Account ID of the member AWS account. | `string` | n/a | yes |
| email | Root email address of the member AWS account. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| member | Object containing SecurityHub member resource |

<!-- END TFDOCS -->
