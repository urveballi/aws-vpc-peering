resource "aws_subnet" "primary_subnet" {
  vpc_id                  = aws_vpc.primary_vpc.id
  cidr_block              = var.primary_subnet_cidr
  availability_zone       = data.aws_availability_zones.primary.names[0]
  map_public_ip_on_launch = true
  provider                = aws.primary

  tags = {
    Name        = "PRIMARY-SUBNET-${var.primary}"
    Environment = "Demo"
  }
}

resource "aws_subnet" "secondary_subnet" {
  vpc_id                  = aws_vpc.secondary_vpc.id
  cidr_block              = var.secondary_subnet_cidr
  availability_zone       = data.aws_availability_zones.secondary.names[0]
  map_public_ip_on_launch = true
  provider                = aws.secondary

  tags = {
    Name        = "SECONDARY-SUBNET-${var.secondary}"
    Environment = "Demo"
  }
}

resource "aws_subnet" "tertiary_subnet" {
  vpc_id                  = aws_vpc.tertiary_vpc.id
  cidr_block              = var.tertiary_subnet_cidr
  availability_zone       = data.aws_availability_zones.tertiary.names[0]
  map_public_ip_on_launch = true
  provider                = aws.tertiary

  tags = {
    Name        = "TERTIARY-SUBNET-${var.tertiary}"
    Environment = "Demo"
  }
}
