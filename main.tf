provider "aws" {
   region = "us-east-1"
   assume_role {
	role_arn = ""
}
}

module "s3" {
 source = "./S3"
}