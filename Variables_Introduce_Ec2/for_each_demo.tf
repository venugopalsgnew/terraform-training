variable "instances" {
  type = map(string)
  default = {
    "WebServer" = "t2.micro"
    "AppServer" = "t2.small"
    "DBServer"  = "t2.medium"
  }
}

resource "aws_instance" "example" {
  for_each      = var.instances
  ami           = "ami-12345678"
  instance_type = each.value

  tags = {
    Name = each.key
  }
}


#for_each = var.instances creates three instances.
#each.key is used for the instance name (WebServer, AppServer, DBServer).
#each.value is used for the instance type.
