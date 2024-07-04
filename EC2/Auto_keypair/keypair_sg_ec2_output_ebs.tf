provider "aws" {
  alias  = "prd"
  region = var.region["prd"]
}

provider "aws" {
  alias  = "nonprd"
  region = var.region["nonprd"]
}

variable "region" {
  type = map(string)
  default = {
    "prd"     = "ap-southeast-1"
    "nonprod" = "ap-southeast-2"
  }
}

variable "ami" {
  type = map(string)
  default = {
    "ap-southeast-1" = "ami-060e277c0d4cce553"
    "ap-southeast-2" = "ami-03f0544597f43a91d"
  }
}

variable "instance_type" {
  type = map(string)
  default = {
    "prd"     = "t2.medium"
    "nonprod" = "t2.micro"
  }
}

variable "instcount" {
  default = 1
}

variable "availability_zones" {
  type = map(list(string))
  default = {
    "ap-southeast-1" = ["ap-southeast-1a", "ap-southeast-1b", "ap-southeast-1c"]
    "ap-southeast-2" = ["ap-southeast-2a", "ap-southeast-2b", "ap-southeast-2c"]
  }
}

resource "tls_private_key" "rsa" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "tf-key-pair" {
  provider   = aws.prd
  key_name   = "tf-key-pair"
  public_key = tls_private_key.rsa.public_key_openssh
}

resource "local_file" "tf-key" {
  content  = tls_private_key.rsa.private_key_pem
  filename = "tf-key-pair"
}

resource "aws_security_group" "ssh-access" {
  provider = aws.prd
  name     = "ssh-access"
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

resource "aws_instance" "prodec2" {
  provider              = aws.prd
  ami                   = var.ami[var.region["prd"]]
  instance_type         = var.instance_type["prd"]
  key_name              = "tf-key-pair"
  count                 = var.instcount
  vpc_security_group_ids = [aws_security_group.ssh-access.id]
  tags = {
    Name = "prodec2-${count.index}"
  }
}

resource "aws_ebs_volume" "ec2vol" {
  provider           = aws.prd
  availability_zone  = var.availability_zones[var.region["prd"]][0]
  size               = 5
  tags = {
    Name = "prodec2-vol"
  }
}

resource "aws_volume_attachment" "ebs_att" {
  provider    = aws.prd
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.ec2vol.id
  instance_id = aws_instance.prodec2[0].id
}

output "publicip" {
  value = {
    public_ip  = aws_instance.prodec2[0].public_ip
    private_ip = aws_instance.prodec2[0].private_ip
    id         = aws_instance.prodec2[0].id
    region     = var.region["prd"]
  }
}
