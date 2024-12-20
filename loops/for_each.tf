resource "aws_instance" "web" {
  for_each      = var.instance_names
  ami           = "ami-0e2c8caa4b6378d8c"
  instance_type = each.value
  key_name      = "test"


  tags = {
    Name = each.key
  }
}


output "instance_info" {
  value = aws_instance.web

}
#for_each will be used to iterate maps majorly, where as count will be used to iterate lists

/*

How to Iterate Over Lists with for_each

If you have a list and need to use for_each, you must ensure the items in the list are unique. Use the toset() function to convert the list to a set.

Example 1: Iterating Over a List (Using toset)

variable "instance_names" {
  default = ["app", "db", "cache"]
}

resource "aws_instance" "example" {
  for_each = toset(var.instance_names)

  ami           = "ami-12345678"
  instance_type = "t2.micro"
  tags = {
    Name = each.value
  }
}


*/
