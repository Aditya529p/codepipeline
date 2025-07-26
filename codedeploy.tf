resource "aws_codedeploy_app" "my_app" {
  name             = "MyCodeDeployApp6666222"
  compute_platform = "Server"
}

resource "random_string" "suffix" {
  length  = 5
  upper   = false
  special = false
}

resource "aws_codedeploy_deployment_group" "my_group" {
  app_name              = aws_codedeploy_app.my_app.name
  deployment_group_name = "MyDeploymentGroup-${random_string.suffix.result}"
  service_role_arn      = aws_iam_role.codepipeline_role.arn

  deployment_style {
    deployment_type  = "IN_PLACE"
    deployment_option = "WITHOUT_TRAFFIC_CONTROL"
  }
}
