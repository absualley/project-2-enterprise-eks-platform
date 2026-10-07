#################################################
# Amazon EKS Cluster
#################################################

resource "aws_eks_cluster" "main" {

  name     = var.cluster_name
  role_arn = var.cluster_role_arn

  version = "1.33"

  vpc_config {

    subnet_ids = var.subnet_ids

    security_group_ids = [
      var.cluster_security_group_id
    ]

    endpoint_private_access = true
    endpoint_public_access  = true
  }

  tags = {

    Name        = var.cluster_name
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"

  }

}

#################################################
# Amazon EKS Managed Node Group
#################################################

resource "aws_eks_node_group" "main" {

  cluster_name = aws_eks_cluster.main.name

  node_group_name = "${var.project_name}-nodes"

  node_role_arn = var.node_role_arn

  subnet_ids = var.subnet_ids

  scaling_config {

    desired_size = 2

    min_size = 2

    max_size = 4

  }

  instance_types = [

    "t3.medium"

  ]

  capacity_type = "ON_DEMAND"

  ami_type = "AL2023_x86_64_STANDARD"

  tags = {

    Name        = "${var.project_name}-node-group"
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"

  }

  depends_on = [

    aws_eks_cluster.main

  ]

}
