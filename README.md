# AWSCICDGroup
AWS IAM Group for CI/CD with GitHub Actions

## Key changes made:
Added Amplify-specific permissions in two statement blocks:

Core Amplify operations (StartJob, GetApp, ListApps, etc.)
Branch management operations (CreateBranch, DeleteBranch, UpdateBranch)
Added Amplify-specific S3 bucket access to allow the CI/CD process to interact with Amplify-generated S3 buckets

Added a new variable amplify_app_id to specify your Amplify application ID for more granular resource-level permissions

How to use this updated Terraform file:
Save the code to a file named github_actions_iam.tf

Create a terraform.tfvars file with your specific values:

aws_account_id = "123456789012"</b>
deployment_bucket_name = "my-app-deployments"</b>
amplify_app_id = "d123abcd456"  # Your Amplify app ID</b>
cloudfront_distribution_id = "E1EXAMPLE"  # If using CloudFront</b>
ecr_repository_name = "my-app"  # If using ECR</b>
lambda_function_name = "my-function"  # If using Lambda</b>

Initialize and apply the Terraform configuration:

terraform init</b>
terraform plan</b>
terraform apply</b>
This configuration follows the principle of least privilege by specifying exact permissions needed for Amplify operations and limiting them to your specific Amplify application.
