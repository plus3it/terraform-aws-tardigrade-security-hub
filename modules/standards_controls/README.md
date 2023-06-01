# terraform-aws-tardigrade-security-hub/standards_control

<!-- BEGIN TFDOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.64.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.64.0 |

## Resources

| Name | Type |
|------|------|

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_control_status"></a> [control\_status](#input\_control\_status) | Control status enabled or disabled | `string` | n/a | yes |
| <a name="input_disabled_reason"></a> [disabled\_reason](#input\_disabled\_reason) | A description of the reason why you are disabling a security standard control | `string` | n/a | yes |
| <a name="input_standards_control_arn"></a> [standards\_control\_arn](#input\_standards\_control\_arn) | The standards control ARN | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_standards_control"></a> [standards\_control](#output\_standards\_control) | Object containing SecurityHub standards control resource |

<!-- END TFDOCS -->
