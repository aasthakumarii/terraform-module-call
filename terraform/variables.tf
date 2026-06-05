variable "aws_region" {
  default = "ap-south-1"
}

variable "availability_zone" {
  default = "ap-south-1a"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  default = "10.0.1.0/24"
}

variable "public_subnet_cidr_2" {
  default = "10.0.2.0/24"
}

variable "ssh_cidr" {
  default = "0.0.0.0/0"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  default = "student-key"
}

variable "backend_repo_name" {
  default = "student-backend"
}

variable "frontend_repo_name" {
  default = "student-frontend"
}

variable "db_name" {
  default = "student_registration"
}

variable "db_username" {
  default = "admin"
}

variable "db_password" {
  sensitive = true
}
