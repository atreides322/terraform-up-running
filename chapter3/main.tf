provider "aws" {
  region = "us-east-2"
}

resource "aws_s3_bucket" "terraform_state" {

  bucket = "atreides322-terraform-up-running-state"

  # Prevent accidental deletion of this S3 bucket
	lifecycle {
		prevent_destroy = true
	}

  # Enable versioning so we can see the full revision history of our
  # state files
  versioning {
    enabled = true
  }

  # Enable server-side encryption by default
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

resource "aws_dynamodb_table" "terraform_locks" {
  name         = "atreides322-terraform-up-running-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
