resource "aws_subnet" "TP-pub" {
  vpc_id     = aws_vpc.TP-vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "TP-pub"
  }
}

resource "aws_subnet" "TP-priv1" {
  vpc_id     = aws_vpc.TP-vpc.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "TP-priv1"
  }
}

resource "aws_subnet" "TP-priv2" {
  vpc_id     = aws_vpc.TP-vpc.id
  cidr_block = "10.0.3.0/24"

  tags = {
    Name = "TP-priv2"
  }
}

resource "aws_subnet" "TP-priv3" {
  vpc_id     = aws_vpc.TP-vpc.id
  cidr_block = "10.0.4.0/24"

  tags = {
    Name = "TP-priv3"
  }
}

resource "aws_subnet" "TP-priv4" {
  vpc_id     = aws_vpc.TP-vpc.id
  cidr_block = "10.0.5.0/24"

  tags = {
    Name = "TP-priv4"
  }
}