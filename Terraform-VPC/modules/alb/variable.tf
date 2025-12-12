variable "sg_id" {
  description = "Security group id for aaplication load balancer"
  type = string 
}

variable "subnets" {
  description = "Subnets id for aaplication load balancer"
  type = list(string)
}

variable "vpc_id" {
  description = "vpc id for aaplication load balancer"
  type = string
}

variable "instances" {
  description = "instances id for aaplication load balancer"
  type = list(string)
}