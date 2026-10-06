#################################################
# Project Information
#################################################

variable "project_name" {
  description = "Project name used for tagging resources"
  type        = string
}

variable "environment" {
  description = "Deployment environment"
  type        = string
}

#################################################
# Networking
#################################################

variable "vpc_id" {
  description = "VPC ID where the security groups will be created"
  type        = string
}

#################################################
# Cluster Information
#################################################

variable "cluster_name" {
  description = "Amazon EKS Cluster Name"
  type        = string
}
