resource "aws_ec2_host" "EC2" {
  ami           = "ami-0233214e13e500f77"
  instance_type = "m5.24xlarge"
  subnet_id = aws_subnet.subnet2.id
  security_groups = [ "SG1" ]
  availability_zone = "eu-central-1a"
  host_recovery     = "on"
  auto_placement    = "on"
}