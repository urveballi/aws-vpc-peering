resource "aws_vpc" "primary" {
  cidr_block       = var.primary_vpc_cidr
  provider         = aws.primary
  enable_dns_hostnames = true
  enable_dns_support   = true
  

  tags = {
    Name = "PRIMARY-VPC-${var.primary}"
  }
}


resource "aws_vpc" "secondary" {
  cidr_block       = var.secondary_vpc_cidr
  provider         = aws.secondary
  enable_dns_hostnames = true
  enable_dns_support   = true
  

  tags = {
    Name = "SECONDARY-VPC-${var.secondary}"
  }
}

resource "aws_vpc" "tertiary" {
  cidr_block       = var.tertiary_vpc_cidr
  provider         = aws.secondary
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "TERTIARY-VPC-${var.tertiary}"
  }
}