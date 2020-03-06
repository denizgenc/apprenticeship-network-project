variable "aws_region" {
  description = "The AWS region used when creating all these resources."
  default     = "eu-west-2"
}

variable "name_prefix" {
  description = "The prefix that should be prepended to the name of each resource."
  default     = "deniz-project-b"
}

variable "wp_database_port" {
  description = "Port used for the MariaDB database"
  default     = 5432
}

variable "wp_database_username" {
  description = "Username used for the less privileged user account on the MariaDB database"
  default = "wordpress"
}

variable "ssh_public_key_path" {
  description = "The path to the ssh key used to connect to the web server"
  default = "~/.ssh/deniz-project-b-key.pub"
}
