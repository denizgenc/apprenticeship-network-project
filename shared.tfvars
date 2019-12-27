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

variable "vpc_network_address_prefix" {
    description = "The beginning of the network address of the VPC(s). Must supply last octet."
    default = "192.168.10"
    # 3rd octet is 10, because 192.168.1 is quite a common choice ... want to avoid colliding with
    # any other VPCs that a colleague may have/may in the future create.
    # Also chose to keep the 3rd octet fixed because we're not going to use enough "devices" to
    # warrant using the bits in the 3rd octet. By keeping it fixed, we make sure that we reduce the
    # chance of operator error when defining new VPCs in this project.
}

variable "vpc_cidr" {
    description = "The CIDR range of the VPC(s)."
    default = "30"
}