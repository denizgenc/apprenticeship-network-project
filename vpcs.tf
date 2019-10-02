resource "aws_vpc" "vpc_1" {
    cidr_block = "192.168.128.0/17"

    tags = {
        Name = "${var.name_prefix}vpc-1"
    }
}

resource "aws_internet_gateway" "igw_1" {
    vpc_id = "${aws_vpc.vpc_1.id}"

    tags = {
        Name = "${var.name_prefix}igw-1"
    }
}
