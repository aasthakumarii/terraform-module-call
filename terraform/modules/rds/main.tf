resource "aws_db_subnet_group" "student" {

  name = "student-db-subnet-group"

  subnet_ids = [
    var.subnet_id,
    var.subnet_id_2
  ]

  tags = {
    Name = "student-db-subnet-group"
  }
}

resource "aws_db_instance" "student" {

  identifier = "student-registration-db"

  engine         = "mysql"
  engine_version = "8.0"

  instance_class = "db.t3.micro"

  allocated_storage = 20

  db_name  = var.db_name
  username = var.db_username
  password = var.db_password

  publicly_accessible = false

  skip_final_snapshot = true

  vpc_security_group_ids = [
    var.security_group_id
  ]

  db_subnet_group_name = aws_db_subnet_group.student.name
}