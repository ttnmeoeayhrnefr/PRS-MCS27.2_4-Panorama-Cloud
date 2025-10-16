resource "aws_subnet" "TP-pub" {
  vpc_id     = aws_vpc.TP-vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "TP-pub"
  }
}