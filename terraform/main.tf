data "aws_ami" "ubuntu" {

  most_recent = true

  owners = [
    "099720109477"
  ]

  filter {
    name = "name"

    values = [
      "ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"
    ]
  }

  filter {
    name = "virtualization-type"

    values = [
      "hvm"
    ]
  }
}

module "vpc" {

  source = "git::https://github.com/aasthakumarii/vpc-module.git?ref=main"

  vpc_cidr             = var.vpc_cidr
  public_subnet_cidr   = var.public_subnet_cidr
  public_subnet_cidr_2 = var.public_subnet_cidr_2

  availability_zone = var.availability_zone

  ssh_cidr = var.ssh_cidr
}

module "iam" {
  source = "git::https://github.com/aasthakumarii/iam-module.git?ref=main"
}

module "ecr" {

  source = "git::https://github.com/aasthakumarii/ecr-module.git?ref=main"

  backend_repo_name  = var.backend_repo_name
  frontend_repo_name = var.frontend_repo_name
}

module "rds" {

  source = "git::https://github.com/aasthakumarii/rds-module.git?ref=main"

  db_name     = var.db_name
  db_username = var.db_username
  db_password = var.db_password

  vpc_id = module.vpc.vpc_id

  security_group_id = module.vpc.security_group_id

  subnet_id   = module.vpc.public_subnet_id
  subnet_id_2 = module.vpc.public_subnet_id_2
}

module "ec2" {

  source = "git::https://github.com/aasthakumarii/ec2-module.git?ref=main"

  ami_id        = data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  subnet_id = module.vpc.public_subnet_id

  security_group_id = module.vpc.security_group_id

  instance_profile_name = module.iam.instance_profile_name

  key_name = var.key_name
}