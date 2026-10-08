#################################################
# Project Information
#################################################

variable "project_name" {
  description = "Project name"
  type        = string
}

variable "environment" {
  description = "Deployment environment"
  type        = string
}

variable "cluster_name" {
  description = "Amazon EKS cluster name"
  type        = string
}

#################################################
# IAM
#################################################

variable "cluster_role_arn" {
  description = "IAM role ARN for the EKS control plane"
  type        = string
}

variable "node_role_arn" {
  description = "IAM role ARN for the worker nodes"
  type        = string
}

#################################################
# Networking
#################################################

variable "subnet_ids" {
  description = "Private subnet IDs for the EKS cluster"
  type        = list(string)
}

#################################################
# Security
#################################################

variable "cluster_security_group_id" {
  description = "Security group ID for the EKS control plane"
  type        = string
}

variable "node_security_group_id" {
  description = "Security group ID for the worker nodes"
  type        = string
}

#################################################
# EBS CSI IAM Role
#################################################

variable "ebs_csi_role_arn" {

  description = "IAM Role ARN used by the EBS CSI Driver"

  type = string

}
