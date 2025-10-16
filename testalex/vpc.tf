## TP 2 : Ajout VPC
resource "aws_vpc" "VPC_TP" {
  cidr_block = "10.0.0.0/16"
}

