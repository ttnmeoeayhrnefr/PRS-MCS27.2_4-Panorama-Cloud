provider "aws" {
  region = "us-east-1"
}


resource "aws_instance" "example" {
 ami           = "ami-0360c520857e3138f"
 instance_type = "t2.micro"
}