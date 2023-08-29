# terraform-aws-tardigrade-security-hub/account

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
| <a name="input_auto_enable_controls"></a> [auto\_enable\_controls](#input\_auto\_enable\_controls) | Boolean that enables the security standards that Security Hub has designated as automatically enabled including: `AWS Foundational Security Best Practices v1.0.0` and `CIS AWS Foundations Benchmark v1.2.0` | `bool` | `true` | no |
| <a name="input_control_finding_generator"></a> [control\_finding\_generator](#input\_control\_finding\_generator) | Manages whether the account reports consolidated control findings, or generates separate findings for every enabled standard. | `string` | `null` | no |
| <a name="input_enable_default_standards"></a> [enable\_default\_standards](#input\_enable\_default\_standards) | Boolean that automatically enables new controls when they are added to standards that are enabled | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_account"></a> [account](#output\_account) | Object containing SecurityHub account resource |

<!-- END TFDOCS -->
