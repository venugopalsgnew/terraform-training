output "aws_ami_id" {
  value = data.aws_ami.example.id
}

output "vpc_info" {
  value = data.aws_vpc.default

}
