# module "lambda_layer_s3" {
#   source = "./modules/lambda_layer"

#   create_layer = true

#   layer_name          = "lambda-layer-s3"
#   description         = "Sagemaker lambda layer (deployed from S3)"
#   compatible_runtimes = ["python3.8"]

# #   source_path = "../src/lambda-layer"

#   store_on_s3 = true
#   s3_bucket   = "layers49"
#   s3_key = "layer.zip"
# }


module "lambda_functions" {
  source = "./modules/lambda_functions"

  function_configurations = [
    {
      function_name   = "function1"
      handler         = "function1.lambda_handler"
      runtime         = "python3.8"
      code_directory  = "function1"
      memory_size        = 128
    },
    {
      function_name   = "function2"
      handler         = "function2.lambda_handler"
      runtime         = "python3.8"
      code_directory  = "function2"
      memory_size        = 128
    }
  ]
}


output "function1_arn" {
  value = module.lambda_functions.lambda_functions["function1"].arn
}

output "function2_arn" {
  value = module.lambda_functions.lambda_functions["function2"].arn
}
