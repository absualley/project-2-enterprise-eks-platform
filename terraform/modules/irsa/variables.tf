#################################################
# Project Information
#################################################

variable "project_name" {
  description = "Project name"
  type        = string
}

#################################################
# OIDC Issuer URL
#################################################

variable "oidc_provider_url" {
  description = "OIDC issuer URL for the EKS cluster"
  type        = string
}
