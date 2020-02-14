variable "aws_region" {
    description = "The AWS region used when creating all these resources."
    default = "eu-west-2"
}

variable "name_prefix" {
    description = "The prefix that should be prepended to the name of each resource."
    default = "deniz-project-b"
}

variable "wp_database_password" {
    description = "Figure out how to manage this password"
}
