output "rds_address" {
  value = aws_db_instance.student.address
}

output "db_name" {
  value = aws_db_instance.student.db_name
}