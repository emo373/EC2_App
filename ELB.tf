resource "aws_elb" "ELB1" {
  name               = "MYELB1>"
  availability_zones = ["eu-central-1a", "eu-central-1b"]

  access_logs {
    bucket        = "my-S3-bucket"
    bucket_prefix = "S3"
    interval      = 60
  }

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  listener {
    instance_port      = 80
    instance_protocol  = "http"
    lb_port            = 443
    lb_protocol        = "https"
    ssl_certificate_id = "arn:aws:iam::123456789012:server-certificate/certName"
  }

  health_check {
    healthy_threshold   = 3
    unhealthy_threshold = 3
    timeout             = 5
    target              = "HTTP:80/"
    interval            = 50
  }

  instances                   = [aws_ec2_host.EC2.id]
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = false
  connection_draining_timeout = 300

  tags = {
    Name = "Terraform-ELB-resource"
  }
}