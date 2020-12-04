provider "aws" {
  region  = "us-east-1"
  # access_key = "xxxx"
  # secret_key = "xxxx"
}

# 1. Create vpc
# 2. Create Internet Gateway
# 3. Create Custom Route Table
# 4. Create a Subnet
# 5. Associate subnet with Route Table
# 6. Create Security Group to allow port 22, 80, 443
# 7. Create a network interface with an ip in the subnet that was created in step 4
# 8. Assign an elastic IP to the network interface created in step 7
# 9. Create Ubuntu server and install/enable apache2




# resource "aws_vpc" "first_vpc" {
#   cidr_block = "10.0.0.0/16"
#   tags = {
#     Name = "production"
#   }
# }

# resource "aws_subnet" "subnet_1" {
#   vpc_id     = aws_vpc.first_vpc.id
#   cidr_block = "10.0.1.0/24"

#   tags = {
#     Name = "prod subnet"
#   }
# }

# resource "aws_instance" "my-first-server" {
#   ami           = "ami-00ddb0e5626798373"
#   instance_type = "t2.micro"
#   tags = {
#     # "Name" = "ubuntu"
#   }
# }

# resource "<provider>_<resource_type>" "name" {

# }
