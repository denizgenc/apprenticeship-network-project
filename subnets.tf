resource "aws_subnet" "subnet_1" {
    vpc_id = "${aws_vpc.vpc_1.id}"
    cidr_block = "192.168.128.0/18"
    availability_zone = "${var.aws_region}a" # e.g. us-east-1a

    tags = {
        Name = "${var.name_prefix}subnet-1-1" # VPC 1, subnet 1
    }
}

resource "aws_subnet" "subnet_2" {
    vpc_id = "${aws_vpc.vpc_1.id}"
    cidr_block = "192.168.192.0/18"
    availability_zone = "${var.aws_region}b" # e.g. us-east-1b

    tags = {
        Name = "${var.name_prefix}subnet-1-2" # VPC 1, subnet 1
    }
}
