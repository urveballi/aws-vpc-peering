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

variable "primary_subnet_cidr" {
  type        = string
  default     = "10.0.1.0/24"
}

variable "secondary_subnet_cidr" {
  type        = string
  default     = "10.1.1.0/24"
}

variable "tertiary_subnet_cidr" {
  type        = string
  default = "192.168.1.0/24"
}

variable "primary_sg_name" {
    type = string
    default = "primary-sg"
}

variable "secondary_sg_name" {
    type = string
    default = "secondary-sg"
}

variable "tertiary_sg_name" {
    type = string
    default = "tertiary-sg"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "primary_key_name" {
  description = "Name of the SSH key pair for Primary VPC instance (us-east-1)"
  type        = string
  default     = ""
}

variable "secondary_key_name" {
  description = "Name of the SSH key pair for Secondary VPC instance (us-west-2)"
  type        = string
  default     = ""
}

variable "tertiary_key_name" {
  description = "Name of the SSH key pair for Tertiary VPC instance (us-west-2)"
  type        = string
  default     = ""
}