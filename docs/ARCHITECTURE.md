# Architecture

## Overview

This project provisions an enterprise-style Amazon Elastic Kubernetes Service (EKS) platform on AWS using Infrastructure as Code (Terraform), configuration management (Ansible), Kubernetes package management (Helm), and Kubernetes manifests.

The platform deploys a highly available Kubernetes cluster across two Availability Zones, configures persistent storage using the Amazon EBS CSI Driver with IAM Roles for Service Accounts (IRSA), deploys a WordPress application backed by MariaDB, and enables horizontal pod autoscaling using the Kubernetes Metrics Server.

---

# High-Level Architecture

```
                         Internet
                             │
                     Internet Gateway
                             │
              ┌──────────────┴──────────────┐
              │                             │
       Public Subnet (AZ-1)         Public Subnet (AZ-2)
              │
         NAT Gateway
        (Elastic IP)
              │
      Private Route Table
              │
      ┌───────┴─────────────────────────────┐
      │                                     │
Private Subnet (AZ-1)              Private Subnet (AZ-2)
      │                                     │
      └──────── Amazon EKS Managed Node Group ────────┐
                                                      │
                                              Amazon EKS Cluster
                                                      │
               ┌──────────────────────────────────────┼────────────────────────────────────┐
               │                                      │                                    │
        Metrics Server                    Amazon EBS CSI Driver                     Helm
               │                                      │                                    │
               │                               gp3 StorageClass                          │
               │                                      │                                    │
               └──────────────────────────────┬───────┘                                    │
                                              │                                            │
                                   Persistent EBS Volumes                                  │
                                              │                                            │
                                  WordPress Deployment + MariaDB
                                              │
                                     Horizontal Pod Autoscaler
```

---

# Infrastructure Components

## Terraform Modules

The infrastructure is organized into reusable Terraform modules.

### IAM Module

Creates:

- Amazon EKS Cluster IAM Role
- Amazon EKS Node IAM Role
- IAM Role for Service Accounts (IRSA)
- Amazon EBS CSI Driver IAM Role

---

### Networking Module

Creates:

- VPC
- Internet Gateway
- NAT Gateway
- Elastic IP
- Public Route Table
- Private Route Table
- Two Public Subnets
- Two Private Subnets

---

### Security Module

Creates:

- Amazon EKS Cluster Security Group
- Worker Node Security Group
- Required ingress and egress rules

---

### Amazon EKS Module

Creates:

- Amazon EKS Cluster
- Managed Node Group
- Amazon EBS CSI Driver Add-on

---

# Kubernetes Components

The Kubernetes platform includes:

- Amazon EKS
- Managed Node Group
- Amazon EBS CSI Driver
- gp3 StorageClass
- Persistent Volumes
- Persistent Volume Claims
- Metrics Server
- Horizontal Pod Autoscaler
- WordPress Deployment
- MariaDB StatefulSet

---

# Configuration Management

Ansible automates installation of:

- AWS CLI
- kubectl
- Helm
- Amazon EKS utilities

---

# Application Deployment

Applications are deployed using Helm.

Current application:

- WordPress
- MariaDB

Persistent storage is dynamically provisioned through the Amazon EBS CSI Driver using the default gp3 StorageClass.

---

# Security Architecture

Security features include:

- IAM Roles for Service Accounts (IRSA)
- Private worker nodes
- Security Groups
- Least-privilege IAM roles
- Private subnets for Kubernetes worker nodes
- NAT Gateway for outbound Internet access

---

# High Availability

The platform is designed for high availability by using:

- Two Availability Zones
- Multiple worker nodes
- Managed Node Groups
- LoadBalancer Service
- Horizontal Pod Autoscaler

---

# Key Technologies

- AWS
- Amazon EKS
- Terraform
- Ansible
- Kubernetes
- Helm
- Docker
- Amazon EBS CSI Driver
- IRSA
- Metrics Server
- Horizontal Pod Autoscaler
