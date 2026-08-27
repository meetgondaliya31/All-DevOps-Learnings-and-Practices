resource "aws_s3_bucket" "remote_s3" {
  bucket = "my-bucket-for-terraformmm"

  tags = {
    Name        = "my-bucket-for-terraformmm"
  }
}