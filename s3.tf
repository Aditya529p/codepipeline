resource "random_id" "suffix" {
  byte_length = 4
}

resource "aws_s3_bucket" "artifact_store" {
  bucket        = "my-newcodepipeline-artifact-bucket-${random_id.suffix.hex}"
  force_destroy = true

  tags = {
    Name = "CodePipeline Artifact Bucket"
  }
}
