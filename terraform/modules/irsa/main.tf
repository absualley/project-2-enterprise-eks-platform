


#################################################
# Retrieve OIDC Certificate
#################################################

data "tls_certificate" "oidc" {
  url = var.oidc_provider_url
}


#################################################
# IAM OIDC Provider
#################################################

resource "aws_iam_openid_connect_provider" "eks" {

  client_id_list = [
    "sts.amazonaws.com"
  ]

  thumbprint_list = [
    data.tls_certificate.oidc.certificates[0].sha1_fingerprint
  ]

  url = var.oidc_provider_url
}

#################################################
# IAM Policy Document
#################################################

data "aws_iam_policy_document" "ebs_csi_assume_role" {

  statement {

    effect = "Allow"

    actions = [
      "sts:AssumeRoleWithWebIdentity"
    ]

    principals {

      type = "Federated"

      identifiers = [
        aws_iam_openid_connect_provider.eks.arn
      ]

    }

    condition {

      test = "StringEquals"

      variable = "${replace(var.oidc_provider_url, "https://", "")}:sub"

      values = [
        "system:serviceaccount:kube-system:ebs-csi-controller-sa"
      ]

    }

  }

}

#################################################
# EBS CSI IAM Role
#################################################

resource "aws_iam_role" "ebs_csi" {

  name = "${var.project_name}-ebs-csi-role"

  assume_role_policy = data.aws_iam_policy_document.ebs_csi_assume_role.json

  tags = {
    Name      = "${var.project_name}-ebs-csi-role"
    ManagedBy = "Terraform"
  }

}

#################################################
# Amazon EBS CSI Driver Policy
#################################################

resource "aws_iam_role_policy_attachment" "ebs_csi" {

  role = aws_iam_role.ebs_csi.name

  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"

}
