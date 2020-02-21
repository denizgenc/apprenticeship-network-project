data "aws_ami" "amzn_linux_2" {
    most_recent = true
    owners = ["amazon"]

    filter {
        name = "name"
        values = ["amzn2-ami-hvm-2.0.*ebs"] # Amazon Linux 2, EBS Storage AMI
    }
}

resource "aws_key_pair" "wp_key_pair" {
    key_name = "${var.name_prefix}-key"
    public_key = trimspace(file(var.ssh_public_key_path))
}

resource "aws_instance" "wp_server_1" {
    ami = data.aws_ami.amzn_linux_2.id
    subnet_id = aws_subnet.subnet_web.id
    vpc_security_group_ids = [aws_security_group.sg_web.id]
    key_name = "${var.name_prefix}-key"
    instance_type = "t2.micro"

    tags = {
        Name = "${var.name_prefix}-wp-server-1"
    }
}

