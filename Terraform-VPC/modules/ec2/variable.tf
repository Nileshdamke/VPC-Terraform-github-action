
variable "sg_id" {
  description = "Security group id for EC2 instance machine"
  type = string 
}

variable "subnets" {
  description = "Subnets for EC2 instance machine"
  type = list(string)
}

variable "ec2_names" {
  description = "EC2 instance machine name"
  type = list(string)
  default = ["webserver1","webserver2"]
}
