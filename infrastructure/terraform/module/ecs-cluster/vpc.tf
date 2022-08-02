data "aws_vpc" "vpc" {
  tags = {
    Name = "monaboiste-vpc"
  }
}

data "aws_subnet" "public_subnets" {
  vpc_id                  = data.aws_vpc.vpc.id
  availability_zone       = element(var.public_subnet_az, count.index)
  count                   = length(var.public_subnet_az)

  tags = {
    Name = "monaboiste-vpc-public-subnet-${element(var.public_subnet_az, count.index)}"
  }
}

data "aws_subnet" "private_subnets" {
  vpc_id                  = data.aws_vpc.vpc.id
  availability_zone       = element(var.private_subnet_az, count.index)
  count                   = length(var.private_subnet_az)

  tags = {
    Name = "monaboiste-vpc-public-subnet-${element(var.private_subnet_az, count.index)}"
  }
}
