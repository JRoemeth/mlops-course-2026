resource "aws_apprunner_service" "service" {
  service_name = local.service_name

  source_configuration {
    authentication_configuration {
      access_role_arn = aws_iam_role.apprunner_role.arn
    }
    image_repository {
      image_identifier      = var.image_identifier
      image_repository_type = "ECR"
      image_configuration {
        port = var.port
      }
    }
    auto_deployments_enabled = true
  }

  tags = var.tags
}

resource "aws_iam_role" "apprunner_role" {
  name = "apprunner-ecr-access-${local.service_name}"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "apprunner.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy" "apprunner_policy" {
  name   = "apprunner-ecr-policy"
  role   = aws_iam_role.apprunner_role.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "ecr:GetDownloadUrlForLayer",
          "ecr:BatchGetImage",
          "ecr:DescribeImages"
        ]
        Resource = "*"
      }
    ]
  })
}