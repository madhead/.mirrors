resource "aws_s3_bucket" "madhead-github-mirrors" {
  bucket = "madhead-github-mirrors"

  versioning {
    enabled = true
  }

  tags = {
    repo = var.repo
  }
}

resource "aws_dynamodb_table" "madhead-github-mirrors" {
  name = "madhead-github-mirrors"

  hash_key = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  billing_mode = "PAY_PER_REQUEST"

  tags = {
    repo = var.repo
  }
}

terraform {
  backend "s3" {
    region         = "eu-central-1"
    bucket         = "madhead-github-mirrors"
    key            = "github.com/madhead/.mirrors"
    dynamodb_table = "madhead-github-mirrors"
  }
}
