variable "primary" { 
    type = string
    default = "us-east-1"
}

variable "secondary" {
    type = string
    default = "us-west-2"
}

variable "tertiary" {
    type = string
    default = "us-west-2"
}

variable "vpc_name_1" {
    type = string
    default = "primary-vpc"
}

variable "vpc_name_2" {
    type = string
    default = "secondary-vpc"
}

variable "vpc_name_3" {
    type = string
    default = "tertiary-vpc"
}

variable "primary_vpc_cidr" {
    type = string
    default = "10.0.0.0/16"
}

variable "secondary_vpc_cidr" {
    type = string
    default = "10.1.0.0/16"
}

variable "tertiary_vpc_cidr" {
    type = string
    default = "192.168.0.0/16"
}