locals {
  name_prefix = join("-", [
    "tws",
    "terraweek",
    "var.environment"
  ])

  comman_tags = merge(
    {
      project = "Terraweek"
    },
    {
      Environment = var.environment
      ManagedBy   = "Terraform"
    }
  )

  project_name = upper("terraweek")
}

/*
if environment is dev then name_prefix become terraweek-dev

also i can use function "UPPER"  then its become TERRAWEEK-DEV
*/