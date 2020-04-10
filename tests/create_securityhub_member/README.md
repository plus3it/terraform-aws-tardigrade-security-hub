# Create SecurityHub Member Test

<!-- BEGIN TFDOCS -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12 |

## Providers

No provider.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| email\_address | Email address associated with the member account. Required input for the SecurityHub member invitation. | `string` | `null` | no |
| product\_subscription\_arns | List of product arns to subscribe to. See https://www.terraform.io/docs/providers/aws/r/securityhub_product_subscription.html | `list(string)` | <pre>[<br>  "arn:aws:securityhub:us-east-1:453761072151:product/turbot/turbot"<br>]</pre> | no |
| standard\_subscription\_arns | List of standard arns to subscribe to. See https://www.terraform.io/docs/providers/aws/r/securityhub_standards_subscription.html | `list(string)` | <pre>[<br>  "arn:aws:securityhub:::ruleset/cis-aws-foundations-benchmark/v/1.2.0",<br>  "arn:aws:securityhub:us-east-1::standards/pci-dss/v/3.2.1"<br>]</pre> | no |

## Outputs

No output.

<!-- END TFDOCS -->
