provider "aws" {
  region = "ap-south-1"

}

resource "aws_instance" "web" {
  ami           = var.ami
  instance_type = var.instance_type
  monitoring    = var.enabled_monitoring

  tags = {
    Name = "Webserver"
  }

}

variable "ami" {
  default = "ami-0e35ddab05955cf57"

}

variable "instance_type" {
  default = "t2.micro"

}

variable "enabled_monitoring" {
  default = true
  type    = bool

}

