# TP 3 : Ajout Apache
resource "aws_instance" "WEB1" {
  ami           = "ami-0360c520857e3138f"
  instance_type = "t2.micro"

  user_data = <<-EOF
              #!/bin/bash
              sleep 60
              sudo apt update -y
              sudo apt install -y apache2 unzip
              sudo systemctl start apache2
              sudo systemctl enable apache2
              echo "Hello from instance TP" > /var/www/html/index.html
              EOF

  tags = {
    Name = "WEB1"
  }
}