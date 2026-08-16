primary   = "us-east-1"
secondary = "us-west-2"
tertiary  = "us-west-2"

primary_vpc_cidr   = "10.0.0.0/16"
secondary_vpc_cidr = "10.1.0.0/16"
tertiary_vpc_cidr  = "192.168.0.0/16"

primary_subnet_cidr   = "10.0.1.0/24"
secondary_subnet_cidr = "10.1.1.0/24"
tertiary_subnet_cidr  = "192.168.1.0/24"

instance_type = "t2.micro"

primary_key_name   = "vpc-peering-demo-east"
secondary_key_name = "vpc-peering-demo-west"
tertiary_key_name  = "vpc-peering-demo-west"
