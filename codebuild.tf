resource "aws_codebuild_project" "my_project" {
  name          = "MyProject"
  description   = "CodeBuild project for building the application"
  build_timeout = 5

  service_role = aws_iam_role.codebuild_service_role.arn

  artifacts {
    type = "NO_ARTIFACTS"
  }

  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = "aws/codebuild/standard:5.0"
    type                        = "LINUX_CONTAINER"
    privileged_mode             = true
  }

  source {
    type            = "GITHUB"
    location        = "https://github.com/your-username/your-repo.git"
    buildspec       = "buildspec.yml"
  }
}