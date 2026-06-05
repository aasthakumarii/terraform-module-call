variable "db_name" {}

variable "db_username" {}

variable "db_password" {
  sensitive = true
}

variable "vpc_id" {}

variable "security_group_id" {}

variable "subnet_id" {}

variable "subnet_id_2" {}