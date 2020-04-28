module "deniz_project_b" {
  source = "./modules/wordpress_server"

  aws_region           = "eu-west-2"
  name_prefix          = "deniz-project-b"
  wp_database_port     = 5432
  wp_database_username = "wordpress"
  ssh_public_key_path  = "~/.ssh/deniz-project-b-key.pub"
}