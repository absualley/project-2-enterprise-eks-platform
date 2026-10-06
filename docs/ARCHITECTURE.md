# Architecture

## Overview

This project provisions an enterprise-style Amazon Elastic Kubernetes Service (EKS) platform using Infrastructure as Code (Terraform) and Configuration Management (Ansible). Applications are deployed using Helm into a Kubernetes cluster running on Amazon EKS.

## Architecture Diagram

```
                        Internet
                            │
                    Internet Gateway
                            │
             ┌──────────────┴──────────────┐
             │                             │
      Public Subnet AZ-1            Public Subnet AZ-2
             │
        NAT Gateway
        (Elastic IP)
             │
      Private Route Table
             │
      ┌──────┴──────────────┐
      │                     │
Private Subnet AZ-1   Private Subnet AZ-2
      │                     │
      └────── Amazon EKS Worker Nodes ──────┘
                     │
              Kubernetes Cluster
                     │
              Helm Deployments
                     │
                 WordPress
```

## Components

### Terraform

Terraform provisions all AWS infrastructure using reusable modules.

Modules include:

- Networking
- IAM
- Security
- Amazon EKS

### Ansible

Ansible prepares the Kubernetes management environment by installing:

- AWS CLI
- kubectl
- Helm
- Supporting EKS tools

### Kubernetes

Amazon EKS hosts containerized workloads.

### Helm

Helm deploys WordPress using a configurable Helm chart.

## Networking Design

- 1 VPC
- 2 Public Subnets
- 2 Private Subnets
- Internet Gateway
- NAT Gateway
- Public Route Table
- Private Route Table

Private worker nodes access the Internet through the NAT Gateway while remaining inaccessible from the public Internet.

Terraform Root Module
│
├── IAM Module
│   ├── Cluster IAM Role
│   └── Worker Node IAM Role
│
├── Networking Module
│   ├── VPC
│   ├── Internet Gateway
│   ├── Public Subnets
│   ├── Private Subnets
│   ├── NAT Gateway
│   └── Route Tables
│
├── Security Module
│   (Next)
│
└── EKS Module
   (Next)
