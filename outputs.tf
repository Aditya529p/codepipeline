output "codepipeline_name" {
  value       = aws_codepipeline.my_pipeline.name
  description = "The name of the CodePipeline"
}

output "s3_bucket_name" {
  value       = aws_s3_bucket.artifact_store.bucket
  description = "The name of the S3 bucket used for storing pipeline artifacts"
}

output "codebuild_project_name" {
  value       = aws_codebuild_project.my_project.name
  description = "The name of the CodeBuild project"
}