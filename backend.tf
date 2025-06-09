terraform {
  backend "s3" {
    bucket         = "kubernetes-labs-tf-backend-aws-s3bucket"
    key            = "lab/state/terraform"
    region         = local.AWS_REGION
    use_lockfile   = true
  }
}