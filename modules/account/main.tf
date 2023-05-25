resource "aws_securityhub_account" "this" {
  control_finding_generator = var.control_finding_generator
}
