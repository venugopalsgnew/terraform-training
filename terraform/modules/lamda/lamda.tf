
data "aws_iam_role" "predefined_role" {
   name = "TFSDL-AWSLambdaServiceRole"
}


resource "aws_lambda_function" "my_lambda_function_with_dependencies" {
  function_name    =  var.function_name
  description      =  var.description
  handler          =  var.handler
  role             = "${data.aws_iam_role.predefined_role.arn}"
  runtime          =  var.runtime
  timeout          =  var.timeout
  filename         =  var.filename
  source_code_hash =  var.source_code_hash
}
