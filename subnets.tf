resource "aws_subnet" "subnet_1" {
    vpc_id = "${aws_vpc.vpc_1.id}"
    cidr_block = "192.168.128.0/18"
    availability_zone = "${var.aws_region}a" # e.g. us-east-1a

    tags = {
        Name = "deniz-project-b-subnet-1"
    }
}

