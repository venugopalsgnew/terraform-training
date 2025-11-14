provider "aws" {
  region = "us-east-1"
}

resource "tls_private_key" "example" {
  algorithm = "RSA"
  rsa_bits  = 4096
}


resource "aws_key_pair" "example" {
  key_name   = "example"
  public_key = tls_private_key.example.public_key_openssh
}

resource "local_file" "example" {
  content         = tls_private_key.example.private_key_pem
  filename        = "C:/Users/venug/terraform/example.pem"
  file_permission = "0400"
}


resource "aws_instance" "nautilus_server" {
  ami           = "ami-0c02fb55956c7d316" # Amazon Linux 2 for us-east-1
  instance_type = "t2.micro"

  key_name = aws_key_pair.example.key_name

  tags = {
    Name = "example-ec2"
  }
}
