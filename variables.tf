variable "aws_region" {
    description = "The AWS region used when creating all these resources."
    default = "eu-west-1"
}

variable "name_prefix" {
    description = "The prefix that should be prepended to the name of each resource."
    default = "deniz-project-b-"
}

variable "sub_domain" { 
    description = "The sub-domain in whatever zone we're hosting this in"
    default = "deniz"
}

