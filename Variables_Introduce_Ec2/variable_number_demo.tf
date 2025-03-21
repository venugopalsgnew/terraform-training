provider "aws" {
  region = "ap-south-1"

}

resource "aws_instance" "web" {
  count         = var.instance_count
  ami           = var.ami
  instance_type = var.instance_type

  tags = {
    Name = "Webserver-${count.index}"
  }

}

variable "instance_count" {
  default = 2
  type    = number

}

variable "ami" {
  default = "ami-0e35ddab05955cf57"
  type    = string

}

variable "instance_type" {
  default = "t2.micro"
  type    = string

}




