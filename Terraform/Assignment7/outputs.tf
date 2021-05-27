output "bucketname" {
  value = join(", ", [aws_s3_bucket.tf_code[0].bucket, aws_s3_bucket.tf_code[1].bucket])
}