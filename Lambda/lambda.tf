provider "aws" {}

data "aws_caller_identity" "current" {
}

resource "aws_iam_role" "lambda_role" {
  name = var.lambda_role

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_lambda_function" "lambda_function" {
  s3_bucket = "kaiburr-test1"
  s3_key    = "HelloWorld.zip"
  function_name = var.lambda_function
  role          = aws_iam_role.lambda_role.arn
  runtime       = var.lambda_runtime
  handler       = var.lambda_handler
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

