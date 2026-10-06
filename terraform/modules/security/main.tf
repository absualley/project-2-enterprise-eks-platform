#################################################
# EKS Cluster Security Group
#################################################

resource "aws_security_group" "eks_cluster" {

  name        = "${var.project_name}-eks-cluster-sg"
  description = "Security group for the Amazon EKS control plane"
  vpc_id      = var.vpc_id

  tags = {
    Name        = "${var.project_name}-eks-cluster-sg"
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

#################################################
# EKS Worker Node Security Group
#################################################

resource "aws_security_group" "eks_nodes" {

  name        = "${var.project_name}-eks-node-sg"
  description = "Security group for Amazon EKS worker nodes"
  vpc_id      = var.vpc_id

  tags = {
    Name        = "${var.project_name}-eks-node-sg"
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

#################################################
# Worker Nodes to Control Plane
#################################################

resource "aws_security_group_rule" "nodes_to_cluster" {

  type      = "ingress"
  from_port = 443
  to_port   = 443
  protocol  = "tcp"

  security_group_id        = aws_security_group.eks_cluster.id
  source_security_group_id = aws_security_group.eks_nodes.id

  description = "Allow worker nodes to communicate with the EKS control plane"
}
#################################################
# Control Plane to Worker Nodes
#################################################

resource "aws_security_group_rule" "cluster_to_nodes" {

  type      = "ingress"
  from_port = 1025
  to_port   = 65535
  protocol  = "tcp"

  security_group_id        = aws_security_group.eks_nodes.id
  source_security_group_id = aws_security_group.eks_cluster.id

  description = "Allow control plane communication to worker nodes"
}

#################################################
# Worker Node Outbound Internet Access
#################################################

resource "aws_security_group_rule" "nodes_egress" {

  type = "egress"

  from_port = 0
  to_port   = 0
  protocol  = "-1"

  security_group_id = aws_security_group.eks_nodes.id

  cidr_blocks = [
    "0.0.0.0/0"
  ]

  description = "Allow outbound Internet access"
}

#################################################
# Cluster Outbound Internet Access
#################################################

resource "aws_security_group_rule" "cluster_egress" {

  type = "egress"

  from_port = 0
  to_port   = 0
  protocol  = "-1"

  security_group_id = aws_security_group.eks_cluster.id

  cidr_blocks = [
    "0.0.0.0/0"
  ]

  description = "Allow outbound Internet access"
}
