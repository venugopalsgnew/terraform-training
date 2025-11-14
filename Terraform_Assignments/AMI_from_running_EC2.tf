# Provision EC2 instance
resource "aws_instance" "ec2" {
  ami           = "ami-0c101f26f147fa7fd"
  instance_type = "t2.micro"
  vpc_security_group_ids = [
    "sg-f37d8fc51c67bc843"
  ]

  tags = {
    Name = "nautilus-ec2"
  }
}


data "aws_instance" "foo" {
  depends_on = [aws_instance.ec2]
  filter {
    name   = "tag:Name"
    values = ["nautilus-ec2"]
  }
}


resource "aws_ami_from_instance" "example" {
  name               = "nautilus-ec2-ami"
  source_instance_id = data.aws_instance.foo.id
}
