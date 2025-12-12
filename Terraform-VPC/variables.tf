variable "region" {
  default = "ap-south-1"
}

variable "vpc_cidr" {
  description = "VPC CIDR range"
  type        = string
}

variable "subnet_cidr" {
  description = "subnet cidr"
  type        = list(string)
}