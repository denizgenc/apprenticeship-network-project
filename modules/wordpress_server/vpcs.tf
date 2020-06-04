resource "aws_vpc" "vpc_1" {
  cidr_block = "192.168.0.0/18"

  tags = {
    Name = "${var.name_prefix}-vpc-1"
  }
}

resource "aws_internet_gateway" "igw_1" {
  vpc_id = aws_vpc.vpc_1.id

  tags = {
    Name = "${var.name_prefix}-igw-1"
  }
}

resource "aws_default_route_table" "route_1" {
  default_route_table_id = aws_vpc.vpc_1.default_route_table_id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw_1.id
  }

  tags = {
    Name = "${var.name_prefix}-route-1"
  }
}
