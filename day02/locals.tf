locals {
  name_prefix = upper("terraweek-${var.environment}")

  comman_tags = {
    project     = "Terraweek"
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

/*
if environment is dev then name_prefix become terraweek-dev

also i can use function "UPPER"  then its become TERRAWEEK-DEV
*/