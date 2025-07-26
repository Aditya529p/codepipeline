# CodeDeploy role
resource "aws_iam_role" "code_deploy_role" {
  name = "codep-role-aditya8515555"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Principal = {
        Service = "codedeploy.amazonaws.com"
      },
      Action = "sts:AssumeRole"
    }]
  })
  tags = {
    Name = "CodeDeployRole"
  }
}

# ✅ CodeBuild role (add this)
resource "aws_iam_role" "codebuild_service_role" {
  name = "codebuild-role-aditya8515555"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Principal = {
        Service = "codebuild.amazonaws.com"
      },
      Action = "sts:AssumeRole"
    }]
  })
  tags = {
    Name = "CodeBuildServiceRole"
  }
}

# Policy attachment for CodeBuild
resource "aws_iam_role_policy_attachment" "codebuild_policy" {
  role       = aws_iam_role.codebuild_service_role.name
  policy_arn = "arn:aws:iam::aws:policy/AWSCodeBuildDeveloperAccess"
}
