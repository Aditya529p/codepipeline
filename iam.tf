resource "aws_iam_role" "codebuild_service_role" {
  name = "codebuild-service-role-92275288"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Service = "codebuild.amazonaws.com"
        },
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "random_string" "suffix" {
  length  = 5
  upper   = false
  special = false
}

resource "aws_iam_role_policy_attachment" "codebuild_policy" {
  role       = aws_iam_role.codebuild_service_role.name
  policy_arn = "arn:aws:iam::aws:policy/AWSCodeBuildDeveloperAccess"
}
