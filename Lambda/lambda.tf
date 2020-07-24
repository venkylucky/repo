provider "aws" {}

data "aws_caller_identity" "current" {
}

resource "aws_lambda_function" "lambda_function" {
  s3_bucket = "kaiburr-test1"
  s3_key    = "HelloWorld.zip"
  function_name = var.lambda_function
  runtime       = var.lambda_runtime
  handler       = var.lambda_handler
  role          = "arn:aws:iam::759442462106:role/service-role/DeployToLambda-role-f6vf89o6"
  timeout       = 20
  depends_on    = [aws_cloudwatch_log_group.log_group]

  environment {
    variables = {
      systemNumber = var.systemNumber
    }
  }
}
resource "aws_cloudwatch_log_group" "log_group" {
  name              = "/aws/lambda/${var.lambda_function}"
  retention_in_days = 14
}

