provider "aws" {
   region = "us-east-2"
   #assume_role {
	#role_arn = "arn:aws:iam::759442462106:role/terraform-test-role"
#}
   shared_credentials_file = "%USERPROFILE%\.aws\credentials"
   }

terraform{
  backend "s3" {
	bucket = "kaiburr-test1"
	key    = "statefile/terraform.tfstate"
	region = "us-east-2"
	#role_arn = "arn:aws:iam::759442462106:role/terraform-test-role"
     }
}

module "s3" {
 source = "./S3"
}

module "lambda" {
 source = "./Lambda"
}