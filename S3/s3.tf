provider "aws" {
   region = "us-east-2"
   assume_role {
	role_arn = "arn:aws:iam::759442462106:role/terraform-test-role"
}
}

resource "aws_s3_bucket" "s3bucket" {
  bucket = "kaiburr-test2"
  acl    = "private"

  tags = {
    Name        = "MyBucket"
    Environment = "Dev"
  }
}