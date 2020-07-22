variable "region" {
  default = "us-east-2"
}

variable "env" {
  default = "dev"
}

variable "accountId" {
	default = "759442462106"
}

variable "project" {
  default = "fbi-test-app-poc"
}

variable "rest_api" {
  default = "test-api"
}

variable "lambda_function" {
  default = "test-api-function-devops-poc"
}

variable "lambda_role" {
  default = "test-api-role-devops-poc"
}

variable "lambda_policy" {
  default = "test-api-policy-devops-poc"
}

variable "lambda_handler" {
  default = "companyinfoAPI::companyinfoAPI.LambdaEntryPoint::FunctionHandlerAsync"
}

variable "lob" {
  default = "apsec"
}

variable "systemNumber" {
  default = "1123"
}

variable "lambda_source" {
  default = "test"
}

variable "lambda_runtime" {
  default = "dotnetcore2.1"
}

variable "owner1" {
  default = "n6634e"
}

variable "owner2" {
  default = "n59a75"
}

