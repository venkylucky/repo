provider "aws" {}

resource "aws_s3_bucket" "s3bucket" {
  bucket = "kaiburr-test4"
  acl    = "private"

  tags = {
    Name        = "MyBucket"
    Environment = "Dev"
  }

  versioning {
    enabled = true 
  }

  website {
    index_document = "index.html"
    error_document = "error.html"
  }
}

resource "aws_s3_bucket_public_access_block" "s3publicaccess" {
  bucket = "${aws_s3_bucket.s3bucket.id}"

  block_public_acls   = false
  block_public_policy = false
  ignore_public_acls  = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "s3bucketpolicy" {
  bucket = "${aws_s3_bucket.s3bucket.id}"

  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "PublicReadGetObject",
            "Effect": "Allow",
            "Principal": "*",
            "Action": "s3:GetObject",
            "Resource": "arn:aws:s3:::kaiburr-test3/*"
        }
    ]
}
POLICY
}
