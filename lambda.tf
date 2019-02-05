resource "aws_lambda_function" "func" {
  function_name = "Func"

  s3_bucket = "mleyb-lambda-bucket"
  s3_key    = "v1.0.0/func.zip"

  handler = "func.handler"
  runtime = "nodejs6.10"

  role = "${aws_iam_role.lambda_exec.arn}"
}

# Simple IAM role dicating what other AWS services the Lambda function may access
resource "aws_iam_role" "lambda_exec" {
  name = "lambda_exec_role"

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