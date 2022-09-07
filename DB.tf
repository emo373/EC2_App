resource "aws_db_instance" "DB" {
  allocated_storage    = 10
  engine               = "MySQL"
  engine_version       = "5.7"
  instance_class       = "db.m6g.16xlarge"
  db_name              = "<MySQL>"
  username             = "test"
  password             = "test123!"
  parameter_group_name = "MySQL"
  vpc_security_group_ids = aws_security_group.MySQL_SG.id
  db_subnet_group_name = aws_db_subnet_group.RDS_subnet.name
  skip_final_snapshot  = true
}

resource "aws_db_subnet_group" "RDS_subnet" {
  name       = "RDS_subnet"
  subnet_ids = aws_subnet.subnet2.id

  tags = {
    Name = "My DB subnet group"
  }
}
