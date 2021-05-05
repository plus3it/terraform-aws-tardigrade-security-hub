# terraform-aws-tardigrade-security-hub/member

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
| account\_id | Account ID of the member AWS account. | `string` | n/a | yes |
| email | Root email address of the member AWS account. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| member | Object containing SecurityHub member resource |

<!-- END TFDOCS -->
