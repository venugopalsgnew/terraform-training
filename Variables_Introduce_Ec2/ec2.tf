resource "aws_instance" "terraform_created" {
  #ami           = var.ami_id
  ami            = lookup(var.ami_id, var.region)
  instance_type = var.instance_type

  tags = {
    Name = "HelloWorld-2"
  }
}

