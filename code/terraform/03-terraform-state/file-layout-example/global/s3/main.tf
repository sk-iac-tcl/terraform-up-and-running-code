provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "${var.bucket_name}"

  versioning {
    enabled = true
  }

  lifecycle {
    prevent_destroy = true
  }
}

## =============================================================================
##  Note: S3 버킷이 생성된 후에 아래 코드 주석을 해제 하고 terraform init을 수행
##        백엔드는 채움 참조 구문을 지원하지 않기 때문에 직접 입력
##        terraform.backend: configuration cannot contain interpolations
##        참조 - https://www.terraform.io/docs/backends/config.html
## =============================================================================

#terraform {
#  backend "s3" {
#    bucket = "(생성한 버킷 이름)"
#    key    = "terraform.tfstate"
#    region = "us-east-1"
#    encrypt = true
#  }
#}