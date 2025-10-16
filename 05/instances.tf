resource "aws_instance" "TP-INSTANCE-WEB1" {
  key_name                 = "admin"
  ami                      = "ami-084568db4383264d4"
  security_groups          = [aws_security_group.TP-SG-WEB1.id]
  subnet_id                = aws_subnet.TP-pub.id
  instance_type            = "t2.micro"
  associate_public_ip_address = true
  private_ip = "10.0.1.10"

  user_data = <<-EOF
              #!/bin/bash
              sleep 60
              sudo apt update -y
              sudo apt install -y apache2 unzip
              sudo systemctl start apache2
              sudo systemctl enable apache2
              echo "Hello Terraform" > /var/www/html/index.html
              EOF

  tags = {
    Name = "TP-INSTANCE-WEB1"
  }
}