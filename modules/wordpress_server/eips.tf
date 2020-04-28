resource "aws_eip" "eip_1" {
  depends_on = [aws_internet_gateway.igw_1]
  vpc        = true
  instance   = aws_instance.wp_server_1.id
  tags = {
    Name = "${var.name_prefix}-eip-1"
  }
}
