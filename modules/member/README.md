# terraform-aws-tardigrade-security-hub/member

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
| <a name="input_account_id"></a> [account\_id](#input\_account\_id) | Account ID of the member AWS account. | `string` | n/a | yes |
| <a name="input_email"></a> [email](#input\_email) | Root email address of the member AWS account. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_member"></a> [member](#output\_member) | Object containing SecurityHub member resource |

<!-- END TFDOCS -->
