# terraform-aws-tardigrade-security-hub/action_target

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
| description | Description for the custom action target | `string` | n/a | yes |
| identifier | ID for the custom action target | `string` | n/a | yes |
| name | Name of the custom action target | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| account | Object containing SecurityHub action target resource |

<!-- END TFDOCS -->
