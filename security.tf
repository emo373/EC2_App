resource "aws_security_group" "MySG" {
   name        = "SG1"
   description = "Allow tcp inbound traffic"
   vpc_id      = aws_vpc.general.id

   ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
   }
   ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
   }

   egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
   }

   tags = {
    Name = "MySG"
 }

}

resource "aws_security_group" "MySQL_SG" {
   name        = "MySQL_SG"
   description = "Allow inbound traffic to DB"
   vpc_id      = aws_vpc.general.id

   ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
   }

   egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
   }

   tags = {
    Name = "MySQL_SG"
 }

}