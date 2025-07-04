# AWSCICDGroup
New AWS IAM Group for CI/CD with GitHub Actions. This is needed to run manually without using GitHub Actions. This TF file is a prerequisite for implementing any CI/CD using GitHub Actions.

## Key changes made:

### Added Amplify-specific permissions in two statement blocks:
Core Amplify operations (StartJob, GetApp, ListApps, etc.)
Branch management operations (CreateBranch, DeleteBranch, UpdateBranch)
Added Amplify-specific S3 bucket access to allow the CI/CD process to interact with Amplify-generated S3 buckets
Added a new variable amplify_app_id to specify your Amplify application ID for more granular resource-level permissions

### How to use this updated Terraform file:
Save the code to a file named github_actions_iam.tf

### Create a terraform.tf file with your specific values:
aws_account_id = "123456789012"<br/>
deployment_bucket_name = "my-app-deployments"<br/>
amplify_app_id = "d123abcd456"  # Your Amplify app ID<br/>
cloudfront_distribution_id = "E1EXAMPLE"  # If using CloudFront<br/>
ecr_repository_name = "my-app"  # If using ECR<br/>
lambda_function_name = "my-function"  # If using Lambda<br/>

### Initialize and apply the Terraform configuration:
1.) terraform init<br/>
2.) terraform plan<br/>
3.) terraform apply<br/>

This configuration follows the principle of least privilege by specifying exact permissions needed for Amplify operations and limiting them to your specific Amplify application.
