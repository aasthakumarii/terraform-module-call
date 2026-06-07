output "vpc_id" {
  value = module.vpc.vpc_id
}

output "subnet_id_1" {
  value = module.vpc.public_subnet_id
}

output "subnet_id_2" {
  value = module.vpc.public_subnet_id_2
}

output "security_group_id" {
  value = module.vpc.security_group_id
}

output "instance_profile_name" {
  value = module.iam.instance_profile_name
}

output "ec2_public_ip" {
  value = module.ec2.public_ip
}

output "backend_ecr_url" {
  value = module.ecr.backend_repo_url
}

output "frontend_ecr_url" {
  value = module.ecr.frontend_repo_url
}

output "rds_endpoint" {
  value = module.rds.rds_address
}

output "database_name" {
  value = module.rds.db_name
}

output "db_name" {
  value = module.rds.db_name
}

output "db_username" {
  value = var.db_username
}

output "db_password" {
  value     = var.db_password
  sensitive = true
}

output "ec2_instance_id" {
  value = module.ec2.instance_id
}
