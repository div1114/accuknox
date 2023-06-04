module "key_pair1" {
  source = "terraform-aws-modules/key-pair/aws"

  key_name           = "us-east-1-key"
  create_private_key = true
  providers = {
    aws = aws
  }
}

module "key_pair2" {
  source = "terraform-aws-modules/key-pair/aws"

  key_name           = "us-east-2-key"
  create_private_key = true
  providers = {
    aws = aws.us-east-2
  }
}