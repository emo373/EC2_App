resource "aws_s3_bucket" "S3" {
  bucket = "my-S3-bucket"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}