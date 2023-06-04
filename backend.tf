terraform {
  backend "s3" {
    bucket         = "accuknox-tf-state"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "accuknox-tf-state-locking"
  }
}
