module "s3-public-lambda" {
  source = "./modules/s3-scan-public"

  filename = "s3-public-payload.zip"
}
