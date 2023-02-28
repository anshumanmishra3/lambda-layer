# resource "aws_lambda_layer_version" "lambda_layer" {
#   filename   = "layer.zip"
#   layer_name = var.layer_name
#   source_code_hash = filebase64sha256("layer.zip")
  
#   s3_bucket = var.s3_bucket
#   s3_key    = var.s3_key

#   compatible_runtimes = ["python3.8"]
# }


resource "aws_lambda_function" "lambda_functions" {
  for_each        = { for c in var.function_configurations : c.function_name => c }
  function_name   = each.value.function_name
  #role            = "arn:aws:iam::558940753150:role/lambda-full-acces"
  role            = "arn:aws:iam::558940753150:role/lambda_custom_role"
  handler         = each.value.handler
  #handler         = each.value.lamdba_handler  
  runtime         = each.value.runtime
  memory_size        = each.value.memory_size
  source_code_hash = filebase64sha256(data.archive_file.lambda_functions[each.key].output_path)
  filename        = data.archive_file.lambda_functions[each.key].output_path
}

data "archive_file" "lambda_functions" {
  for_each  = { for c in var.function_configurations : c.function_name => c }
  type      = "zip"
  source_dir = each.value.code_directory
  output_path = "${path.module}/${each.key}.zip"
}
