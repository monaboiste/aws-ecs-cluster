locals {
  vpc_name = "monaboiste-vpc-${var.region}"
}

data "aws_vpc" "vpc" {
  tags = {
    Name = local.vpc_name
  }
}

data "aws_subnets" "public_subnets" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.vpc.id]
  }

  tags = {
    Name = "${local.vpc_name}-public-subnet-*"
  }
}

data "aws_subnets" "private_subnets" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.vpc.id]
  }

  tags = {
    Name = "${local.vpc_name}-private-subnet-*"
  }
}
