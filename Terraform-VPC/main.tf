module "vpc" {
  source      = "./modules/vpc"
  vpc_cidr    = var.vpc_cidr
  subnet_cidr = var.subnet_cidr
}

module "sg" {
  source = "./modules/sg"
  vpc_id = module.vpc.vpc_id # yaha module "vpc" ka vpc_id value pass kare rhe hai sg may.
}

# Note- module 'vpc' alag module hai aur 'sg' alag module hai to direct vpc_id pass nahi kar sakte sg' module may. usske liye paile 'vpc' ka output lena padenga output.tf may. phir root ke main file may jaake 'sg' module create karna padenga. 'sg ka path deke next line may module.vpc pass karke module 'vpc' ka output 'vpc_id' pass karenge. iss terah work karenga ye.

module "ec2" {
  source  = "./modules/ec2"
  sg_id   = module.sg.sg_id
  subnets = module.vpc.subnet_ids
}

module "alb" {
  source      = "./modules/alb"
  sg_id       = module.sg.sg_id
  subnets     = module.vpc.subnet_ids
  vpc_id      = module.vpc.vpc_id
  instances = module.ec2.instances
}

