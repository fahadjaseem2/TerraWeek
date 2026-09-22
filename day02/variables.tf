/*
variable "environment" {
  description = "Deployment Environment"
  type        = string
  default     = dev
 default = This means if the user doesn't provide a value, Terraform uses: varibale.tf value 
}
*/

variable "instance_count" {
  description = "number of Instance"
  type        = number
  default     = 1
}

variable "enable_monitoring" {
  description = "Enable monitoring"
  type        = bool
  default     = true
}

/* list(string) */
variable "availability_zones" {
  description = "Availability_zones"
  type        = list(string)
  default     = ["eu-north-1", "us-west-2"]
}

/* map(string) */
variable "tags" {
  description = "Common resource tags"
  type        = map(string)
  /* map = key value  */
  default = {
    Environment = "dev"
    Project     = "tarraweek"
  }
}

/* set(string) */
variable "allowed_region" {
  description = "allowed region aws"
  type        = set(string)
  default     = ["eu-north-1", "us-west-2"]
}
/* A set is a collection of unique values. */

/* object */
variable "server_config" {
  description = "Server Configuration"

  type = object({
    name          = string
    instance_type = string
    monitoring    = bool
    disk_size     = number
  })

  default = {
    name          = "web-server"
    instance_type = "t3.micro"
    monitoring    = true
    disk_size     = 10
  }
}
/* object can contain different data types. */

/* tuple */
variable "server_details" {
  description = "server details of aws"

  type = tuple([
    string,
    number,
    bool
  ])
  /* order matters */
  default = [
    "web-server",
    20,
    true
  ]
}

/* validation */
variable "environment" {
  description = "deployment environment"
  type        = string
  default     = "dev"

  validation {
    condition = contains(
      ["dev", "staging", "prod"],
      var.environment
    )

    error_message = "environment must be one of: dev, staging, prod"
  }
}

/* sensitive */
variable "db_password" {
  description = "database password"
  type        = string
  sensitive   = true
}