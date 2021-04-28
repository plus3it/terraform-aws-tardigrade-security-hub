# terraform-aws-tardigrade-security-hub/action_target

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
| description | Description for the custom action target | `string` | n/a | yes |
| identifier | ID for the custom action target | `string` | n/a | yes |
| name | Name of the custom action target | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| account | Object containing SecurityHub action target resource |

<!-- END TFDOCS -->
