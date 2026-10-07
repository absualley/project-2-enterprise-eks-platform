#################################################
# Cluster Name
#################################################

output "cluster_name" {
  description = "Amazon EKS Cluster Name"
  value       = aws_eks_cluster.main.name
}

#################################################
# Cluster Endpoint
#################################################

output "cluster_endpoint" {
  description = "Amazon EKS Cluster Endpoint"
  value       = aws_eks_cluster.main.endpoint
}

#################################################
# Cluster Certificate Authority
#################################################

output "cluster_certificate_authority_data" {
  description = "Cluster certificate authority data"
  value       = aws_eks_cluster.main.certificate_authority[0].data
}

#################################################
# Cluster ARN
#################################################

output "cluster_arn" {
  description = "Amazon EKS Cluster ARN"
  value       = aws_eks_cluster.main.arn
}

#################################################
# Managed Node Group Name
#################################################

output "node_group_name" {
  description = "Amazon EKS Managed Node Group Name"
  value       = aws_eks_node_group.main.node_group_name
}
