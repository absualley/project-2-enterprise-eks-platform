#################################################
# Outputs
#################################################

output "ebs_csi_addon_name" {

  description = "Amazon EBS CSI Driver Add-on"

  value = aws_eks_addon.ebs_csi.addon_name

}
