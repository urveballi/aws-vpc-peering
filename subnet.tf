resource "aws_subnet" "primary" {
  vpc_id                  = aws_vpc.primary.id
  cidr_block              = var.primary_vpc_cidr
  availability_zone       = data.aws_availability_zones.primary.names[0]
  map_public_ip_on_launch = true
  provider                = aws.primary

  tags = {
    Name        = "PRIMARY-SUBNET-${var.primary}"
    Environment = "Demo"
  }
}

resource "aws_subnet" "secondary" {
  vpc_id                  = aws_vpc.secondary.id
  cidr_block              = var.secondary_vpc_cidr
  availability_zone       = data.aws_availability_zones.secondary.names[0]
  map_public_ip_on_launch = true
  provider                = aws.secondary

  tags = {
    Name        = "SECONDARY-SUBNET-${var.secondary}"
    Environment = "Demo"
  }
}

resource "aws_subnet" "tertiary" {
  vpc_id                  = aws_vpc.tertiary.id
  cidr_block              = var.tertiary_vpc_cidr
  availability_zone       = data.aws_availability_zones.secondary.names[0]
  map_public_ip_on_launch = true
  provider                = aws.secondary

  tags = {
    Name        = "TERTIARY-SUBNET-${var.tertiary}"
    Environment = "Demo"
  }
}
