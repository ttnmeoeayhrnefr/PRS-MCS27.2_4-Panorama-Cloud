## MODIFICATION EFFECTUEE : Ajout des différentes variables qui étaient vides, et ajout des "ami" qui permettent de mettre les ISO dans les instances.

variable "region" {
    description ="AWS region"
    type        =string
    default     ="us-east-1"
}
variable "vpc-cidr" {
    description = "CIDR block for the VPC"
    type        = string
    default     = "10.0.0.0/16"
}
variable "subnet-cidr" {
    description = "CIDR block for the subnet"
    type        = string
    default     = "10.0.1.0/24"
}
variable "availability_zone" {
    description = "AWS availability zone"
    type        = string
    default     = "us-east-1a"
}
 
 
resource "aws_vpc" "default" {
  cidr_block = var.vpc-cidr
}
 
resource "aws_subnet" "subnet-1" {
  vpc_id            = aws_vpc.default.id
  cidr_block        = var.subnet-cidr
  availability_zone = var.availability_zone
}
 
resource "aws_security_group" "default" {
  name        = "test-security-group"
  description = "Allow TCP/ICMP"
  vpc_id      = aws_vpc.default.id
 
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }
 
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
 
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
 
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
 
  ingress {
    from_port   = 1000
    to_port     = 2000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
 
resource "aws_instance" "nginx_instance" {
  ami           = "ami-0360c520857e3138f" # Replace with appropriate AMI ID
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.subnet-1.id
  vpc_security_group_ids = [aws_security_group.default.id]
  tags = {
    Name = "nginx-proxy"
  }
}
 
resource "aws_instance" "web1" {
  ami           = "ami-0360c520857e3138f" # Replace with appropriate AMI ID
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.subnet-1.id
  vpc_security_group_ids = [aws_security_group.default.id]
  tags = {
    Name = "web1"
  }
}
 
resource "aws_instance" "web2" {
  ami           = "ami-0360c520857e3138f" # Replace with appropriate AMI ID
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.subnet-1.id
  vpc_security_group_ids = [aws_security_group.default.id]
  tags = {
    Name = "web2"
  }
}
 
resource "aws_instance" "web3" {
  ami           = "ami-0360c520857e3138f" # Replace with appropriate AMI ID
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.subnet-1.id
  vpc_security_group_ids = [aws_security_group.default.id]
  tags = {
    Name = "web3"
  }
}
 
resource "aws_instance" "mysqldb" {
  ami           = "ami-0360c520857e3138f" # Replace with appropriate AMI ID
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.subnet-1.id
  vpc_security_group_ids = [aws_security_group.default.id]
  tags = {
    Name = "mysqldb"
  }
}