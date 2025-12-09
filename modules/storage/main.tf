resource "random_pet" "suffix" {
  length = 2
}

resource "aws_s3_bucket" "bucket" {
  bucket = "${var.prefix}-${random_pet.suffix.id}"

  tags = {
    Name        = "${var.prefix}-bucket"
    Environment = "demo"
    ManagedBy   = "Terraform Cloud"
  }
}
