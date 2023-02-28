resource "aws_lambda_layer_version" "lambda_layer" {
  filename   = "layer.zip"
  layer_name = var.layer_name
  source_code_hash = filebase64sha256("layer.zip")
  
  s3_bucket = var.s3_bucket
  s3_key    = var.s3_key

  compatible_runtimes = ["python3.8"]
}
