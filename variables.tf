variable "aws_region" {
  description = "The AWS region used when creating all these resources."
  default     = "eu-west-2"
}

variable "name_prefix" {
  description = "The prefix that should be prepended to the name of each resource."
  default     = "deniz-project-b"
}

variable "wp_database_password" {
  description = "Figure out how to manage this password"
}

variable "wp_database_port" {
  description = "Port used for the PostgreSQL database"
  default     = 5432
}

variable "ssh_public_key_path" {
  description = "The path to the ssh key used to connect to the web server"
}
