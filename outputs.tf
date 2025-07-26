output "codepipeline_name" {
  value       = aws_codepipeline.my_pipeline.name
  description = "The name of the CodePipeline"
}

output "codebuild_project_name" {
  value       = aws_codebuild_project.my_project.name
  description = "The name of the CodeBuild project"
}

output "codedeploy_app_name" {
  value       = aws_codedeploy_app.my_app.name
  description = "The name of the CodeDeploy application"
}

output "deployment_group_name" {
  value       = aws_codedeploy_deployment_group.my_group.deployment_group_name
  description = "The name of the CodeDeploy deployment group"
}

output "artifact_bucket_name" {
  value       = aws_s3_bucket.artifact_store.bucket
  description = "The artifact S3 bucket used by CodePipeline"
}
