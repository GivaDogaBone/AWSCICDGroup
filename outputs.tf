# Output the ARN of the created group
output "cicd_group_arn" {
  value = aws_iam_group.cicd_group.arn                      # The actual value to be outputted
  description = "ARN of the created group" # Description of what this output represents
}