provider "aws" {
   region = "us-east-1"
   assume_role {
	role_arn = ""
}
}

resource "aws_s3_bucket" "s3bucket" {
  bucket = "test-s3-bucket"
  acl    = "private"

  tags = {
    Name        = "MyBucket"
    Environment = "Dev"
  }
}