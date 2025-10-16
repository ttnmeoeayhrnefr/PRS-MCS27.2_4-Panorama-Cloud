resource "aws_internet_gateway" "TP-igw" {
  vpc_id = aws_vpc.TP-vpc.id

  tags = {
    Name = "TP-igw"
  }
}
