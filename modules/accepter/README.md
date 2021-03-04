# terraform-aws-tardigrade-security-hub/accepter

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
| master\_account\_id | Account ID of the AWS SecurityHub master account that sent the invite | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| accepter | Object containing SecurityHub accepter resource |

<!-- END TFDOCS -->
