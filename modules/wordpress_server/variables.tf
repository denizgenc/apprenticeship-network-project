variable "aws_region" {
  description = "The AWS region used when creating all these resources."
}

variable "name_prefix" {
  description = "The prefix that should be prepended to the name of each resource."
}

variable "wp_database_port" {
  description = "Port used for the MariaDB database"
}

variable "wp_database_username" {
  description = "Username used for the less privileged user account on the MariaDB database"
}

variable "ssh_public_key_path" {
  description = "The path to the ssh key used to connect to the web server"
}
