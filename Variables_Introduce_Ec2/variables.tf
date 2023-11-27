
variable "instance_type" {
    default = "t2.micro"
}

variable "region" {
    default = "us-east-2"
}

variable "ami_id" {
    type = map
    default = {
        us-east-1 = "ami-0fc5d935ebf8bc3bc"
        us-east-2 = "ami-0e83be366243f524a"
        
    }
}