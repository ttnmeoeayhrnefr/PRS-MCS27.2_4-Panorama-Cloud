resource "aws_nat_gateway" "TP-natgw" {
  subnet_id     = aws_subnet.TP-pub.id
  allocation_id = aws_eip.TP-nateip.id

  tags = {
    Name = "TP-natgw"
  }
}
