resource "aws_route_table" "route_table_db" {
    vpc_id = aws_vpc.vpc_1.id

    tags ={
        Name = "${var.name_prefix}-route-table-db"
    }
}

resource "aws_route_table" "route_table_web" {
    vpc_id = aws_vpc.vpc_1.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw_1.id
    }

    tags ={
        Name = "${var.name_prefix}-route-table-web"
    }
}
