data "aws_vpc" "vpc" {
  tags = {
    Name = "monaboiste-vpc"
  }
}

data "aws_subnets" "public_subnets" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.vpc.id]
  }

  tags = {
    Name = "monaboiste-vpc-public-subnet-*"
  }
}

data "aws_subnets" "private_subnets" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.vpc.id]
  }

  tags = {
    Name = "monaboiste-vpc-private-subnet-*"
  }
}
