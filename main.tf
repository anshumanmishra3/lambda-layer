module "lambda_layer_s3" {
  source = "./modules/lambda_layer"

  create_layer = true

  layer_name          = "lambda-layer-s3"
  description         = "Sagemaker lambda layer (deployed from S3)"
  compatible_runtimes = ["python3.8"]

#   source_path = "../src/lambda-layer"

  store_on_s3 = true
  s3_bucket   = "layers49"
  s3_key = "layer.zip"
}
