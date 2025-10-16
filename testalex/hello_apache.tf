provider "aws" {
  region = "us-east-1"
}


resource "aws_instance" "Apache" {
 ami           = "ami-0360c52085e3138f"
 instance_type = "t2.micro"

 user_data = <<-EOF
              #!/bin/bash
              sleep 60
              sudo apt update -y
              sudo apt install -y apache2 unzip
              sudo systemctl start apache2
              sudo systemctl enable apache2
              echo "Hello from instance Apache" > /var/www/html/index.html
              EOF

  tags = {
    Name = "APACHE_Instance"
  }
}


