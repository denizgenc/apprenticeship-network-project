data "aws_ami" "amzn_linux_2" {
    most_recent = true
    owners = ["amazon"]

    filter {
        name = "name"
        values = ["amzn2-ami-hvm-2.0.*ebs"] # Amazon Linux 2, EBS Storage AMI
    }
}

resource "aws_instance" "instance_1" {
    ami = "${data.aws_ami.amzn_linux_2.id}"
    subnet_id = "${aws_subnet.subnet_1.id}"
    vpc_security_group_ids = ["${aws_security_group.sg_1.id}"]
    key_name = "deniz-project-b-key" # TODO: Consider moving this out to a variable?
    instance_type = "t2.micro"

    tags = {
        Name = "deniz-project-b-ec2-1"
    }
}

