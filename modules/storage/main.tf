resource "random_id" "bucket_suffix" {
  byte_length = 4

  keepers = {
    run_id = timestamp()
  }
}

resource "aws_s3_bucket" "this" {
  bucket = "${var.prefix}-${random_id.bucket_suffix.hex}"
}

  tags = {
    Name        = "${var.prefix}-bucket"
    Environment = "demo"
    ManagedBy   = "Terraform Cloud"
  }
}
