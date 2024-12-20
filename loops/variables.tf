variable "instance_names" {
  type = map(string)
  default = {
    web  = "t2.micro"
    uat  = "t2.large"
    prod = "t3.large"
  }

}
