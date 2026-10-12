#################################################
# EKS Cluster
#################################################

variable "cluster_name" {
  description = "Amazon EKS Cluster Name"
  type        = string
}

#################################################
# IAM
#################################################

variable "ebs_csi_role_arn" {
  description = "IAM Role ARN for the Amazon EBS CSI Driver"
  type        = string
}
