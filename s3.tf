resource "random_id" "suffix" {
  byte_length = 4
}

resource "aws_s3_bucket" "artifact_store" {
  bucket        = "unique-bucket-aws-35549827"
  force_destroy = true

  tags = {
    Name = "CodePipeline Artifact Bucket"
  }
}
