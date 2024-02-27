terraform {
  backend "s3" {
    bucket         = "ravinaborkar09876"
    key            = "backend/demo.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "remote-backend"
  }
}