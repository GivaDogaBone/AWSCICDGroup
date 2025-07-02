# Variables
variable "aws_region" {
  description = "AWS region for resources"
  default     = "us-east-1"
}

variable "aws_account_id" {
  type = string                              # The type of the variable, in this case a string
  # default = "***** Put your AWS Account ID here!!! *****"   # Default value for the variable
  default = "230650864394"   # Default value for the variable
  description = "The type of AWS Account ID" # Description of what this variable represents
}

variable "deployment_bucket_name" {
  type = string                                      # The type of the variable, in this case a string
  default = ""                                       # Default value for the variable
  description = "The type of AWS my-app-deployments" # Description of what this variable represents
}

variable "iam_role_id" {
  type = string                               # The type of the variable, in this case a string
  default = "*"                               # Default value for the variable
  description = "The type of AWS IAM Role ID" # Description of what this variable represents
}

variable "mfa_role_id" {
  type = string                               # The type of the variable, in this case a string
  default = "*"                               # Default value for the variable
  description = "The type of AWS MFA Role ID" # Description of what this variable represents
}

variable "q_role_id" {
  type = string                               # The type of the variable, in this case a string
  default = "*"                               # Default value for the variable
  description = "The type of AWS Amazon Q Role ID" # Description of what this variable represents
}

variable "amplify_app_id" {
  type = string                                  # The type of the variable, in this case a string
  default = ""                                   # Default value for the variable
  description = "The type of AWS Amplify app ID" # Description of what this variable represents
}

variable "cloudfront_distribution_id" {
  type = string                                       # The type of the variable, in this case a string
  default = ""                                        # Default value for the variable
  description = "The type of AWS If using CloudFront" # Description of what this variable represents
}

variable "ecr_repository_name" {
  type = string                                # The type of the variable, in this case a string
  default = ""                                 # Default value for the variable
  description = "The type of AWS If using ECR" # Description of what this variable represents
}

variable "lambda_function_name" {
  type = string                                   # The type of the variable, in this case a string
  default = ""                                    # Default value for the variable
  description = "The type of AWS If using Lambda" # Description of what this variable represents
}

variable "ec2_instance_id" {
  type        = string
  default     = "*"                                    # Default to all instances, but should be restricted in production
  description = "EC2 instance ID for CI/CD operations"
}
