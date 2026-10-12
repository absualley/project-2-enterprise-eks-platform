#################################################
# Outputs
#################################################

output "ebs_csi_role_arn" {
  description = "IAM Role ARN for the Amazon EBS CSI Driver"
  value       = aws_iam_role.ebs_csi.arn
}
