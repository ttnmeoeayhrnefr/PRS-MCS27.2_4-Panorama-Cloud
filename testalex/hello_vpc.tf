resource "aws_vpc" "Panorama-VPC" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "Panorama-VPC"
  }
}