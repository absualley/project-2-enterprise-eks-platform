# Project Summary

# Enterprise Amazon EKS Platform

## Executive Summary

This project demonstrates the design, deployment, and operation of an enterprise-style Kubernetes platform on Amazon Web Services (AWS).

The platform was built using Infrastructure as Code (Terraform), configuration management (Ansible), Kubernetes package management (Helm), and native Kubernetes resources. It provisions a highly available Amazon Elastic Kubernetes Service (EKS) cluster capable of running stateful containerized applications with persistent storage and horizontal pod autoscaling.

The project emphasizes automation, security, scalability, and operational troubleshooting using AWS and Kubernetes best practices.

---

# Project Objectives

The primary objectives of this project were to:

- Build reusable Infrastructure as Code using Terraform modules.
- Deploy a highly available Amazon EKS cluster.
- Configure secure AWS networking.
- Implement IAM Roles for Service Accounts (IRSA).
- Configure persistent Kubernetes storage using the Amazon EBS CSI Driver.
- Automate workstation configuration using Ansible.
- Deploy applications using Helm.
- Implement Kubernetes Horizontal Pod Autoscaling.
- Document the deployment and troubleshooting process.

---

# AWS Services Used

- Amazon VPC
- Amazon EKS
- Amazon EC2
- Amazon EBS
- Elastic Load Balancer
- Internet Gateway
- NAT Gateway
- Elastic IP
- IAM
- IAM Roles for Service Accounts (IRSA)

---

# Technologies

- Terraform
- Ansible
- Kubernetes
- Helm
- Docker
- Git
- GitHub
- AWS CLI
- kubectl

---

# Architecture Highlights

The platform includes:

- Modular Terraform architecture
- Multi-AZ networking
- Public and private subnets
- Managed Node Groups
- Secure IAM design
- Amazon EBS CSI Driver
- gp3 StorageClass
- Persistent Volumes
- Metrics Server
- Horizontal Pod Autoscaler
- WordPress application
- MariaDB database

---

# Technical Challenges Solved

During development several real-world infrastructure challenges were encountered and resolved.

## IAM Roles for Service Accounts (IRSA)

Configured secure IAM authentication between Kubernetes service accounts and AWS services.

---

## OIDC Provider Mismatch

Diagnosed and resolved an OpenID Connect (OIDC) provider mismatch that prevented the Amazon EBS CSI Driver from authenticating with AWS Security Token Service (STS).

This required:

- Validating the EKS cluster OIDC issuer.
- Inspecting IAM trust policies.
- Associating the correct IAM OIDC provider.
- Recreating the EBS CSI Driver add-on.

---

## Persistent Storage

Configured:

- Amazon EBS CSI Driver
- Default gp3 StorageClass
- Dynamic Persistent Volume provisioning
- Persistent Volume Claims

---

## Kubernetes Autoscaling

Installed:

- Metrics Server
- Horizontal Pod Autoscaler

Verified CPU metrics collection and automatic scaling capability.

---

# Skills Demonstrated

This project demonstrates experience with:

- Infrastructure as Code
- Amazon Web Services
- Kubernetes Administration
- Amazon EKS
- IAM
- Cloud Networking
- Terraform Module Design
- Helm
- Ansible
- Kubernetes Storage
- Kubernetes Security
- Kubernetes Autoscaling
- Production Troubleshooting

---

# Key Outcomes

Successfully deployed:

- Highly available Amazon EKS cluster
- Managed Kubernetes worker nodes
- Secure networking
- Persistent storage
- WordPress application
- MariaDB database
- Horizontal Pod Autoscaler
- AWS Load Balancer

---

# Future Enhancements

Potential future improvements include:

- GitHub Actions CI/CD
- Argo CD GitOps deployment
- AWS Load Balancer Controller
- NGINX Ingress Controller
- cert-manager with HTTPS
- Prometheus
- Grafana
- External DNS
- Terraform-managed IAM OIDC Provider
- Automated end-to-end testing

---

# Conclusion

This project provided practical experience designing, deploying, troubleshooting, and operating a production-style Kubernetes platform on AWS.

The implementation demonstrates cloud infrastructure automation, Kubernetes operations, secure authentication, persistent storage, and application deployment using industry-standard DevOps tools and practices.
