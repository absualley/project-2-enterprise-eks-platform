#################################################
# EKS Cluster Security Group
#################################################

output "cluster_security_group_id" {
  description = "Amazon EKS Cluster Security Group ID"
  value       = aws_security_group.eks_cluster.id
}

#################################################
# Worker Node Security Group
#################################################

output "node_security_group_id" {
  description = "Amazon EKS Worker Node Security Group ID"
  value       = aws_security_group.eks_nodes.id
}
