

provider "aws" {
    region = var.region
}


data "archive_file" "lamda_function_code" {
  source_dir  = "../../../../lambda_function_code/src/tfsdl-edp-operations-test/"
  output_path = "../../../../lambda_function_code/src/tfsdl-edp-operations-test.zip"
  type        = "zip"

}


data "archive_file" "lamda_function_code1" {
  source_dir  = "../../../../lambda_function_code/src/tfsdl-edp-operations-test1/"
  output_path = "../../../../lambda_function_code/src/tfsdl-edp-operations-test1.zip"
  type        = "zip"

}




module "lambda_function" {
    source = "../../../modules/lamda/"
    function_name = var.function_name
    handler = "welcome.hello"
    runtime = "python3.7"
    filename = var.filename 
   # source_code_hash = data.archive_file.lamda_function_code.output_base64sha256 
   #source_code_hash = filebase64sha256("data.archive_file.lamda_function_code.output_path")
    source_code_hash = data.archive_file.lamda_function_code.output_base64sha256 
}



module "lambda_function2" {
    source = "../../../modules/lamda/"
    function_name = var.function_name1
    handler = "welcome1.hello"
    runtime = "python3.7"
    filename = var.filename1
   # source_code_hash = data.archive_file.lamda_function_code.output_base64sha256
   #source_code_hash = filebase64sha256("data.archive_file.lamda_function_code.output_path")
    source_code_hash = data.archive_file.lamda_function_code1.output_base64sha256
}

