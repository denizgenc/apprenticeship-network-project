resource "aws_vpc" "vpc_1" {
    cidr_block = "192.168.128.0/17"

    tags = {
        Name = "deniz-project-b-vpc-1"
    }
}

