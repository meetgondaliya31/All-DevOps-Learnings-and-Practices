resource "aws_dynamodb_table" "dynamodb-table" {
  name           = "aws-dynamo-table"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name        = "aws-dynamo-table"
  }
}