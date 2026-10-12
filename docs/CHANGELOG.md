# Changelog

## v0.1.0

### Added

- Initialized GitHub repository
- Created project directory structure
- Created Terraform module structure
- Created Ansible role structure
- Created Kubernetes manifests directory
- Created Helm directory
- Added initial documentation
- Implemented IAM module
- Began Networking module

# Changelog

## v0.2.0

### Added

- Terraform IAM module
- Terraform Networking module
- VPC
- Internet Gateway
- Public Subnets
- Private Subnets
- NAT Gateway
- Route Tables
- Route Table Associations

### Validation

- terraform fmt
- terraform validate
- terraform plan
- terraform apply

## v0.3.0

### Added

- Security Module
- EKS Cluster Security Group
- Worker Node Security Group
- Security Group Rules

### Validation

- terraform fmt
- terraform validate
- terraform plan
- terraform apply

# v1.1.0

## Added
- Dedicated IRSA module
- Dedicated Add-ons module
- Terraform-managed IAM OIDC Provider
- Terraform-managed Amazon EBS CSI Driver
- gp3 StorageClass

## Changed
- Refactored Terraform into smaller modules
- Improved dependency graph
- Simplified EKS architecture

## Fixed
- Eliminated manual IRSA setup
- Eliminated EBS CSI Driver CrashLoopBackOff
- Fixed PersistentVolume provisioning 
