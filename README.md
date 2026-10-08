# Project 2 – Enterprise Amazon EKS Platform

## Overview

This project demonstrates the deployment of an enterprise-ready Kubernetes platform on AWS using Infrastructure as Code, configuration management, and Kubernetes package management.

The platform provisions a production-style Amazon EKS environment using modular Terraform code, configures the management workstation with Ansible, deploys applications with Helm, and implements Kubernetes autoscaling and persistent storage.

---

# Architecture

Developer
        │
        ▼
GitHub Repository
        │
        ▼
Terraform
        │
 ┌──────────────────────────┐
 │           AWS            │
 ├──────────────────────────┤
 │ IAM                      │
 │ VPC                      │
 │ Public / Private Subnets │
 │ NAT Gateway              │
 │ Internet Gateway         │
 │ Security Groups          │
 │ Amazon EKS               │
 │ Managed Node Groups      │
 │ IAM Roles for Service    │
 │ Accounts (IRSA)          │
 │ Amazon EBS CSI Driver    │
 └─────────────┬────────────┘
               │
        Kubernetes Cluster
               │
     ┌──────────────────────┐
     │ Metrics Server       │
     │ Horizontal Pod Autoscaler │
     │ Helm                 │
     │ WordPress            │
     │ MariaDB              │
     │ Persistent EBS       │
     └──────────────────────┘

---

# Technologies Used

- AWS
- Amazon EKS
- Terraform
- Ansible
- Kubernetes
- Helm
- Docker
- IAM Roles for Service Accounts (IRSA)
- Amazon EBS CSI Driver
- Git
- GitHub

---

# Repository Structure

project-2-enterprise-eks-platform/

├── terraform/
├── ansible/
├── helm/
├── kubernetes/
├── docs/
├── screenshots/
└── README.md

---

# Features

- Modular Terraform architecture
- Reusable Terraform modules
- Secure VPC networking
- Amazon EKS cluster
- Managed Node Groups
- Security Groups
- IAM Roles
- IRSA authentication
- Amazon EBS CSI Driver
- Persistent Storage
- Metrics Server
- Horizontal Pod Autoscaler
- Helm-based application deployment
- WordPress deployment
- MariaDB deployment
- Infrastructure validation

---

# Project Status

## Completed

- Repository initialization
- Terraform project structure
- IAM module
- Networking module
- Security module
- Amazon EKS module
- Managed Node Group
- IRSA configuration
- EBS CSI Driver
- Default gp3 StorageClass
- Ansible automation
- Helm deployment
- WordPress deployment
- Persistent storage
- Metrics Server
- Horizontal Pod Autoscaler
- End-to-end validation

---

# Lessons Learned

Throughout this project I gained practical experience with:

- Infrastructure as Code using Terraform
- Kubernetes cluster administration
- Amazon EKS architecture
- IAM Roles for Service Accounts (IRSA)
- OIDC authentication
- Persistent storage with the Amazon EBS CSI Driver
- Helm package management
- Kubernetes troubleshooting
- Terraform module design
- AWS networking

One of the most valuable troubleshooting exercises involved diagnosing an OIDC provider mismatch that prevented the EBS CSI Driver from authenticating. Resolving this required validating IAM trust policies, the cluster's OIDC issuer, and recreating the missing IAM OIDC provider before redeploying the add-on.

---

# Future Improvements

- Manage the IAM OIDC Provider using Terraform
- Add CI/CD with GitHub Actions
- Deploy Ingress Controller
- Deploy cert-manager
- Add HTTPS using ACM
- Deploy Prometheus and Grafana
- Deploy ArgoCD
- Implement GitOps

---

# Documentation

Additional documentation is available in the `docs/` directory.

- Architecture
- Deployment Guide
- Troubleshooting Guide
- Changelog
- Lessons Learned

---

# Author

Alhaji Sualley

Cloud / DevOps Engineer
