terraform{
  backend "s3" {
	bucket = "kaiburr-test"
	key    = "statefile/S3.tfstate"
	region = "us-east-1"
	role_arn = "arn:aws:iam::759442462106:role/terraform-test-role"
     }
}