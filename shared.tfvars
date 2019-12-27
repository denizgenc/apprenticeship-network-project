# This file contains variables that do not affect whether the environment is healthy or
# misconfigured, so are shared across environments (for example CIDRs)
variable "aws_region" {
    description = "The AWS region used when creating all these resources."
    default = "eu-west-1"
}

variable "name_prefix" {
    description = "The prefix that should be prepended to the name of each resource."
    default = "deniz-project-b-"
}