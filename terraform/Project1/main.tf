provider "aws" {
  region  = "us-east-1"
  access_key = "AKIAI2HT5XMEWOL72OGQ"
  secret_key = "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"
}

resource "aws_vpc" "first_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "production"
  }
}

resource "aws_subnet" "subnet_1" {
  vpc_id     = aws_vpc.first_vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "prod subnet"
  }
}

resource "aws_instance" "my-first-server" {
  ami           = "ami-00ddb0e5626798373"
  instance_type = "t2.micro"
  tags = {
    # "Name" = "ubuntu"
  }
}

# resource "<provider>_<resource_type>" "name" {

# }
