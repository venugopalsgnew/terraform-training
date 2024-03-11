terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.26.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"

}

# https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/user-data.html ( For user_data from AWS Doc)

resource "aws_instance" "example" {
  ami           = "ami-07d9b9ddc6cd8dd30"
  instance_type = "t2.micro"
  key_name = "jenkins"
  security_groups = [aws_security_group.example_sg.name]
  user_data = <<-EOF
    #!/bin/bash
    apt-get update -y
    apt-get install -y apache2
    systemctl start apache2
    systemctl enable apache2
  EOF

  tags = {
    Name = "HelloWorld-2"
  }
}


resource "aws_security_group" "example_sg" {
  name        = "example-security-group"
  description = "Allow SSH and HTTP inbound traffic"
  
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

  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output "instance_details" {
  value = {
    id         = aws_instance.example.id
    public_ip  = aws_instance.example.public_ip
    private_ip = aws_instance.example.private_ip
    # Add more attributes here as needed
  }
}


