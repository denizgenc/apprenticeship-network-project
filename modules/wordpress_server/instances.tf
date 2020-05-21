data "aws_ami" "amzn_linux_2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-2.0.*ebs"] # Amazon Linux 2, EBS Storage AMI
  }
}

resource "aws_key_pair" "wp_key_pair" {
  key_name   = "${var.name_prefix}-key"
  public_key = trimspace(file(var.ssh_public_key_path))
}

resource "aws_instance" "wp_server_1" {
  ami                    = data.aws_ami.amzn_linux_2.id
  subnet_id              = aws_subnet.subnet_web.id
  vpc_security_group_ids = [aws_security_group.sg_web.id]
  key_name               = aws_key_pair.wp_key_pair.key_name
  #user_data              = file("lamp_installation.sh")
  user_data     = <<END
#!/usr/bin/env bash
# HISTFILE=~/.bash_history  # Trying to log what happens
# set -o history            # Ditto
cd /home/ec2-user  # Makes it easier for us to check everything when sshing
sudo yum update -y
sudo amazon-linux-extras install -y lamp-mariadb10.2-php7.2 php7.2
sudo yum install -y httpd mariadb
mysql --user='${aws_db_instance.wp_database_1.username}' \
      --password='${aws_db_instance.wp_database_1.password}' \
      --host='${aws_db_instance.wp_database_1.address}' \
      --port='${var.wp_database_port}' \
      '${aws_db_instance.wp_database_1.name}' << EOF 
CREATE USER '${var.wp_database_username}' IDENTIFIED BY '${random_password.db_user_password.result}';
GRANT ALL PRIVILEGES ON ${aws_db_instance.wp_database_1.name}.* TO ${var.wp_database_username};
FLUSH PRIVILEGES;
Exit
EOF
wget https://wordpress.org/wordpress-5.0.tar.gz
tar -xzf wordpress-5.0.tar.gz
cd wordpress
cat << EOF > wp-config.php
<?php
define('DB_NAME', '${aws_db_instance.wp_database_1.name}');
define('DB_USER', '${var.wp_database_username}');
define('DB_PASSWORD', '${random_password.db_user_password.result}');
define('DB_HOST', '${aws_db_instance.wp_database_1.endpoint}');
define( 'DB_CHARSET', 'utf8' );
define( 'DB_COLLATE', '' );
EOF
curl https://api.wordpress.org/secret-key/1.1/salt/ >> wp-config.php
cat << EOF >> wp-config.php

\$table_prefix  = 'wp_';
define('WP_DEBUG', false);
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');
require_once(ABSPATH . 'wp-settings.php');
EOF
cd /home/ec2-user
sudo cp -r -p wordpress/* /var/www/html/ # -p preserves ownership and permissions. Files have 644 and folders have 755, which is fine
sudo chown -R apache:apache /var/www/html/* # Change ownership to the httpd account, should fix image upload issues
sudo chmod 660 /var/www/html/wp-config.php # Only allow user and group (i.e. apache) to read the config
sudo service httpd start
# history > executed_commands.txt  # Enable with 2nd and 3rd lines of this heredoc for basic logging
END
  instance_type = "t2.micro"

  tags = {
    Name = "${var.name_prefix}-wp-server-1"
  }
}
