resource "aws_security_group" "TP-SG-WEB1" {
  name        = "TP-SG-WEB1"
  description = "TP-SG-WEB1"
  vpc_id      = aws_vpc.TP-vpc.id

  ingress {
    description = "Allow icmp"
    from_port = -1
    to_port = -1
    protocol = "icmp"
  }

  ingress {
    description = "Allow SSH from External"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.allowed_ssh_ips
  }

  ingress {
    description = "Allow HTTP from Any"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow out Traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}