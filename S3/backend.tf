terraform{
  backend "s3" {
	bucket = "test"
	key    = "statefile/S3.tfstate"
	region = "us-east-1"
	role_arn = "role arn"
     }
}