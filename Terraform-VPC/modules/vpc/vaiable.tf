variable "vpc_cidr" {
  description = "VPC CIDR range"
  type = string
}

variable "subnet_cidr" {
  description = "subnet cidr"
  type = list(string)
}

variable "subnet_names" {
  description = "subnet names"
  type = list(string)
  default = ["Publicsubnet1", "Publicsubnet2"]
}