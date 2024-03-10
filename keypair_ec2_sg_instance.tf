
provider "aws" {
    region = "us-east-1"
}

## ssh-keygen -t rsa -b 2048 -f deployer-key.pem ## Run this command to generate pub key & private key, public key content place it below under public_key section to generate key

resource "aws_key_pair" "deployer1" {
  key_name   = "deployer-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDb13lTkV4zU5vUe7CECBJi5l9TIzxdV+F661bn3j1yihfH4Mlfb+1S1GPuHEiaLrKUYPppNNrwBLV5/x/N//ZKk2vM6aw5De1mLoOkYNU/GQpgrZqr2SHVrt80+5+Hiz1aA8/KqdqEMSc6EJCeZkLhqt3Y/KPkvyeRJ39/+ZqNlYNg4Cor/phUluaoS0Op4kCG2NGqumVRn+KqOVuOvKa4+ebScnfJsznwoZAsH/ZIeviog8BXXumDheaB4svpgGqYR8lkecroAweh0yuYO5NJmBVYr/XJPH4AN7FDa/i26Nksbq94kMjFas9FVwBFpKqqCAIFim7qbQueLufkWXeR venug@Venu"
  #public_key = file("YourKeyPair.pem.pub)
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

resource "aws_instance" "web1" {
  ami           = "ami-05a5f6298acdb05b6"
  instance_type = "t2.micro"
  #key_name = "deployer-key"
  key_name      = aws_key_pair.deployer1.key_name
  security_groups = [aws_security_group.example_sg.name]

  tags = {
    Name = "HelloWorld"
  }
}
