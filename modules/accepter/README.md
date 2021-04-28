# terraform-aws-tardigrade-security-hub/accepter

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
| master\_account\_id | Account ID of the AWS SecurityHub master account that sent the invite | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| accepter | Object containing SecurityHub accepter resource |

<!-- END TFDOCS -->
