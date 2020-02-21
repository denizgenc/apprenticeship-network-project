resource "aws_subnet" "subnet_web" {
    vpc_id = aws_vpc.vpc_1.id
    cidr_block = "192.168.0.0/17"
    availability_zone = "${var.aws_region}a" # e.g. us-east-1a

    tags = {
        Name = "${var.name_prefix}-subnet-1-1" 
    }
}

resource "aws_subnet" "subnet_db_1" {
    vpc_id = aws_vpc.vpc_1.id
    cidr_block = "192.168.128.0/18"
    availability_zone = "${var.aws_region}a"

    tags = {
        Name = "${var.name_prefix}-subnet-db-1"
    }
}

resource "aws_subnet" "subnet_db_2" {
    vpc_id = aws_vpc.vpc_1.id
    cidr_block = "192.168.192.0/18"
    availability_zone = "${var.aws_region}b"

    tags = {
        Name = "${var.name_prefix}-subnet-db-2"
    }
}

resource "aws_route_table_association" "subnet_web_association" {
    # Just use the default VPC route table
    route_table_id = aws_vpc.vpc_1.main_route_table_id
    subnet_id = aws_subnet.subnet_web.id
}

resource "aws_route_table_association" "subnet_db_1_association" {
    route_table_id = aws_route_table.route_table_db.id
    subnet_id = aws_subnet.subnet_db_1.id
}

resource "aws_route_table_association" "subnet_db_2_association" {
    route_table_id = aws_route_table.route_table_db.id
    subnet_id = aws_subnet.subnet_db_2.id
}
