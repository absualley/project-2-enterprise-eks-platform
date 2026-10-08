output "cluster_role_arn" {

  value = aws_iam_role.eks_cluster_role.arn

}

output "node_role_arn" {

  value = aws_iam_role.eks_node_role.arn

}

#################################################
# EBS CSI Role ARN
#################################################

output "ebs_csi_role_arn" {

  description = "IAM Role ARN for the EBS CSI Driver"

  value = aws_iam_role.ebs_csi.arn

}
