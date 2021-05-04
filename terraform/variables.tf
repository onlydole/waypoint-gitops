variable "project_name" {
  type        = string
  description = "Globally used project name for this demo."
  default     = "minecraft"
  validation {
    # check the length of the string and ensure it does not contain spaces
    # see https://www.terraform.io/docs/language/values/variables.html#custom-validation-rules
    condition = (
      length(var.project_name) > 4 &&
      length(var.project_name) < 32 &&
      replace(var.project_name, " ", "") == var.project_name
    )

    error_message = "The project_name must be between 4 and 32 characters and may not contain spaces."
  }
}

variable "region" {
  type        = string
  description = "AWS US-based Region that will be used in this demo."
  default     = "us-west-2"
}

variable "availability_zones" {
  type        = list(string)
  description = "Availability zones that will be used in this demo."
  default     = ["us-west-2a", "us-west-2b", "us-west-2c"]
}

variable "cluster_version" {
  type        = string
  description = "The Kubernetes version for our clusters"
  default     = "1.19"
}

variable "cidr" {
  type        = string
  description = "The CIDR block to use for this demo"
  default     = "10.0.0.0/16"
}
