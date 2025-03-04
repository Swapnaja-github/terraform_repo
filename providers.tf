terraform {
  backend "s3" {
    bucket         = "swap-terraform-state-bucket"  # Replace with your actual S3 bucket name
    key            = "terraform.tfstate"          # The file path to store the state
    region         = "us-east-1"                  # Your AWS region
    encrypt        = true                         # Encrypt state file at rest
    dynamodb_table = "swap-terraform-state-lock"       # DynamoDB table for state locking
  }
}
