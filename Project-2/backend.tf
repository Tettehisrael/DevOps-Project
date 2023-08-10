terraform {
  backend "s3" {
    bucket = "devops-with-tate"
    region = "us-east-1"
    key    = "jenkins-server/terraform.tfstate"
  }
}