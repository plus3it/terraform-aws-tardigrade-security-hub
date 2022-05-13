terraform {
  required_version = ">= 0.13"

  required_providers {
    aws = {
      source                = "hashicorp/aws"
      version               = ">= 3.29.0"
      configuration_aliases = [aws.admininstrator]
    }
  }
}
