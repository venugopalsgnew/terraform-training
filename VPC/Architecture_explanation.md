# Provisioned VPC and its components detailed explanation

We are working with Terraform configuration to provision AWS resources within a VPC. This Terraform script defines several components of a VPC including subnets, route tables, internet gateways, NAT gateways, EC2 instances, and security groups.

Here's a breakdown of the script and what each section does:


## VPC Setup (aws_vpc): 

Creates a VPC with a specified CIDR block and instance tenancy.

## Public and Private Subnets (aws_subnet):

Defines public and private subnets within the VPC, each with its own CIDR block and associated availability zone.
Public subnets have the option map_public_ip_on_launch set to true to allow instances launched within them to have public IPs.

## Internet Gateway (aws_internet_gateway):

Creates an internet gateway and attaches it to the VPC to enable internet connectivity for resources in the public subnet.

## Routing Tables (aws_route_table and aws_route_table_association):

Defines route tables for public and private subnets.
Associates the public subnet with the route table pointing to the internet gateway.

Sets up a route table for the private subnet with a NAT gateway for internet-bound traffic.

## NAT Gateway (aws_nat_gateway) and Elastic IP (aws_eip):

Creates a NAT gateway with an associated Elastic IP address to allow private subnet instances to access the internet while remaining private.

## Security Groups (aws_security_group):

Defines security groups:
One (lab_sg) allowing SSH traffic (port 22) from anywhere to instances associated with it.
Another (lab_sg_db) allowing SSH traffic only from instances associated with the first security group (lab_sg), which typically represents a web server allowing database access.
EC2 Instances (aws_instance):

## Launches two EC2 instances:

One as a web server (Lab_Web_Server) in the public subnet with a security group (lab_sg) allowing SSH traffic.

Another as a database server (DB_Server) in the private subnet with the same security group (lab_sg) allowing SSH traffic only from the web server security group.
This configuration sets up a basic VPC with public and private subnets, enables internet connectivity for resources in the public subnet via an internet gateway, and implements a NAT gateway for private subnet internet access. It also provisions EC2 instances with different security groups defining their communication rules.