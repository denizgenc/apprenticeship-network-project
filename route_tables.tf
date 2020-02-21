resource "aws_route_table" "route_table_db" {
    vpc_id = aws_vpc.vpc_1.id
}
