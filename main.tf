provider "aws" {
   region = "us-east-2"
   assume_role {
	role_arn = "arn:aws:iam::759442462106:role/terraform-test-role"
}
}

module "s3" {
 source = "./S3"
}

module "lambda" {
 source = "./Lambda"
}