# terraform-aws-tardigrade-security-hub/action_target

<!-- BEGIN TFDOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.29.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3.29.0 |

## Resources

| Name | Type |
|------|------|

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_description"></a> [description](#input\_description) | Description for the custom action target | `string` | n/a | yes |
| <a name="input_identifier"></a> [identifier](#input\_identifier) | ID for the custom action target | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Name of the custom action target | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_account"></a> [account](#output\_account) | Object containing SecurityHub action target resource |

<!-- END TFDOCS -->
