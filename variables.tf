# Variables
variable "aws_region" {
  description = "AWS region for resources"
  default     = "us-east-1"
}

variable "aws_account_id" {
  type = string                              # The type of the variable, in this case a string
  default = "***** Put your AWS Account ID here!!! *****"   # Default value for the variable
  description = "The type of AWS Account ID" # Description of what this variable represents
}

variable "deployment_bucket_name" {
  type = string                                      # The type of the variable, in this case a string
  default = ""                                       # Default value for the variable
  description = "The type of AWS my-app-deployments" # Description of what this variable represents
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
