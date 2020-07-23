provider "aws" {
   region = "us-east-2"
   assume_role {
	role_arn = "arn:aws:iam::759442462106:role/terraform-test-role"
}
}

resource "aws_s3_bucket" "s3bucket" {
  bucket = "kaiburr-test3"
  acl    = "private"

  tags = {
    Name        = "MyBucket"
    Environment = "Dev"
  }

  versioning {
    enabled = true 
  }

  cors_rule {
     allowed_headers = ["*"]
     allowed_methods = ["PUT", "POST"]
     allowed_origins = ["https://s3-website-test.hashicorp.com"]
  }

  website {
    index_document = "index.html"
    error_document = "error.html"
  }
}
