provider "aws" {
  region = "${var.aws_region}"
  access_key = "<to be added>"
  secret_key = "<to be added>"
}

resource "random_id" "tf_bucket_id" {
  byte_length = 2
  count = "${var.number_of_instances}"
}

resource "aws_s3_bucket" "tf_code" {
    bucket        = "${var.project_name}-${random_id.tf_bucket_id[count.index].dec}"
    acl           = "private"

    force_destroy =  true
    count = "${var.number_of_instances}"

    tags = {
      Name = "tf_bucket${count.index + 1}"
  }
    
}