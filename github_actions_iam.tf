terraform {
  required_version = ">= 1.0.0" # Ensure that the Terraform version is 1.0.0 or higher

  required_providers {
    aws = {
      source = "hashicorp/aws" # Specify the source of the AWS provider
      version = "~> 4.0"        # Use a version of the AWS provider that is compatible with version
    }
  }
}

provider "aws" {
  region = "us-east-1"  # Set the AWS region to US East (N. Virginia)
}

# Create the IAM Group for CI/CD
resource "aws_iam_group" "cicd_group" {
  name = "GitHubActionsCI"
}

# Create a custom policy for CI/CD operations
resource "aws_iam_policy" "cicd_policy" {
  name        = "GitHubActionsCIPolicy"
  description = "Policy for GitHub Actions CI/CD with least privilege permissions"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      # EC2 permissions for CI/CD
      {
        Effect = "Allow"
        Action = [
          "ec2:DescribeInstances",
          "ec2:DescribeInstanceStatus",
          "ec2:DescribeInstanceTypes",
          "ec2:DescribeImages",
          "ec2:DescribeSecurityGroups",
          "ec2:DescribeSubnets",
          "ec2:DescribeVpcs",
          "ec2:DescribeTags"
        ]
        Resource = "*"
      },
      # EC2 permissions for specific instances
      {
        Effect = "Allow"
        Action = [
          "ec2:StartInstances",
          "ec2:StopInstances",
          "ec2:RebootInstances"
        ]
        Resource = "arn:aws:ec2:${var.aws_region}:${var.aws_account_id}:instance/${var.ec2_instance_id}"
      },
      # Amplify permissions for CI/CD
      {
        Effect = "Allow"
        Action = [
          "amplify:StartJob",
          "amplify:StopJob",
          "amplify:GetApp",
          "amplify:GetBranch",
          "amplify:GetJob",
          "amplify:ListApps",
          "amplify:ListBranches",
          "amplify:ListJobs",
          "amplify:CreateDeployment",
          "amplify:StartDeployment",
          "amplify:UpdateApp"
        ]
        Resource = "arn:aws:amplify:${var.aws_region}:${var.aws_account_id}:apps/${var.amplify_app_id}*"
      },
      # Additional Amplify permissions for branch management
      {
        Effect = "Allow"
        Action = [
          "amplify:CreateBranch",
          "amplify:DeleteBranch",
          "amplify:UpdateBranch"
        ]
        Resource = "arn:aws:amplify:${var.aws_region}:${var.aws_account_id}:apps/${var.amplify_app_id}/branches/*"
      },
      # S3 permissions for artifact storage and static website deployment
      {
        Effect = "Allow"
        Action = [
          "s3:PutObject",
          "s3:GetObject",
          "s3:ListBucket",
          "s3:DeleteObject"
        ]
        Resource = [
          "arn:aws:s3:::${var.deployment_bucket_name}",
          "arn:aws:s3:::${var.deployment_bucket_name}/*",
          "arn:aws:s3:::amplify-*",
          "arn:aws:s3:::amplify-*/*"
        ]
      },
      # CloudFront permissions for cache invalidation
      {
        Effect = "Allow"
        Action = [
          "cloudfront:CreateInvalidation",
          "cloudfront:GetInvalidation",
          "cloudfront:ListInvalidations"
        ]
        Resource = "arn:aws:cloudfront::${var.aws_account_id}:distribution/${var.cloudfront_distribution_id}"
      },
      # ECR permissions for container deployments
      {
        Effect = "Allow"
        Action = [
          "ecr:GetAuthorizationToken",
          "ecr:BatchCheckLayerAvailability",
          "ecr:GetDownloadUrlForLayer",
          "ecr:BatchGetImage",
          "ecr:InitiateLayerUpload",
          "ecr:UploadLayerPart",
          "ecr:CompleteLayerUpload",
          "ecr:PutImage"
        ]
        Resource = "arn:aws:ecr:${var.aws_region}:${var.aws_account_id}:repository/${var.ecr_repository_name}"
      },
      # Lambda permissions for serverless deployments
      {
        Effect = "Allow"
        Action = [
          "lambda:UpdateFunctionCode",
          "lambda:GetFunction",
          "lambda:UpdateFunctionConfiguration"
        ]
        Resource = "arn:aws:lambda:${var.aws_region}:${var.aws_account_id}:function:${var.lambda_function_name}"
      }
    ]
  })
}

# Attach the policy to the group
resource "aws_iam_group_policy_attachment" "cicd_policy_attachment" {
  group      = aws_iam_group.cicd_group.name
  policy_arn = aws_iam_policy.cicd_policy.arn
}
