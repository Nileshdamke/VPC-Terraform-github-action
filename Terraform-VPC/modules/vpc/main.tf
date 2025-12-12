# vpc

resource "aws_vpc" "my_vpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name = "my_vpc"
  }
}

# 2 subnets

resource "aws_subnet" "subnets" {
  count = length(var.subnet_cidr)   # ye var.subnet_cidr ki jitni length hongi uttni vo length lenga.
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = var.subnet_cidr[count.index] # subnet ka count 2 hai to index start 0 & 1 lenga agar 3 subnet hai to count 0,1,2 aise lenga. [first vo maine.tf ke variable.tf may jayenga value ke liye uuske baad root directory ke terraform.tfvars se value lenga.]
  availability_zone = data.aws_availability_zones.available.names[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name = var.subnet_names[count.index]
  }
}

# Internet Gateway

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "MyInternetGateway"
  }
}

# Route table

resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0" # public rakenge
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "MyRouteTable"
  }
}

# Route Table Association

resource "aws_route_table_association" "rta" {
  count = length(var.subnet_cidr)
  subnet_id      = aws_subnet.subnets[count.index].id
  route_table_id = aws_route_table.rt.id
}