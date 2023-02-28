variable "layer_name" {
  type        = string
  description = "The name of the Lambda Layer to create"
  default = "layer"
}

variable "s3_bucket" {
  type        = string
  description = "The name of the S3 bucket where the ZIP file is stored"
}

variable "s3_key" {
  type        = string
  description = "The key of the ZIP file in the S3 bucket"
}
