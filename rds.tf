resource "aws_db_subnet_group" "db_subnet_group_1" {
  name       = "${var.name_prefix}-db-subnet-group-1"
  subnet_ids = ["${aws_subnet.subnet_db_1.id}", "${aws_subnet.subnet_db_2.id}"]

  tags = {
    Name = "${var.name_prefix}-db-subnet-group-1"
  }
}

resource "aws_db_instance" "wp_database_1" {
  identifier          = "${var.name_prefix}-wp-database-1"
  allocated_storage   = 20
  engine              = "mariadb"
  engine_version      = "10.2"
  instance_class      = "db.t2.micro"
  port                = var.wp_database_port
  skip_final_snapshot = true

  db_subnet_group_name   = aws_db_subnet_group.db_subnet_group_1.name
  vpc_security_group_ids = [aws_security_group.sg_database.id]

  availability_zone = "${var.aws_region}b" # EC2 will be on a, so put this on b

  name     = "wp_database"
  username = "wordpress_master_user"
  password = random_password.db_master_password.result

  tags = {
    Name = "${var.name_prefix}-wp-database-1"
  }
}
