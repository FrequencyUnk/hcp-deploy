resource "aws_ec2_transit_gateway" "deploy_gw" {
  tags = {
    Name = var.gateway_name
  }
}

resource "aws_ram_resource_share" "deploy_rs" {
  name                      = "learn-hcp-resource-share"
  allow_external_principals = true
}

resource "aws_ram_principal_association" "deploy_pa" {
  resource_share_arn = aws_ram_resource_share.deploy_rs.arn
  principal          = hcp_hvn.deploy_hcp_hvn.provider_account_id
}

resource "aws_ram_resource_association" "deploy_ra" {
  resource_share_arn = aws_ram_resource_share.deploy_rs.arn
  resource_arn       = aws_ec2_transit_gateway.deploy_gw.arn
}

resource "hcp_aws_transit_gateway_attachment" "deploy_attach" {
  depends_on = [
    aws_ram_principal_association.deploy_pa,
    aws_ram_resource_association.deploy_ra,
  ]

  hvn_id                        = hcp_hvn.deploy_hcp_hvn.hvn_id
  transit_gateway_attachment_id = var.transit_gateway_attachment_id
  transit_gateway_id            = aws_ec2_transit_gateway.deploy_gw.id
  resource_share_arn            = aws_ram_resource_share.deploy_rs.arn
}

resource "aws_ec2_transit_gateway_vpc_attachment_accepter" "deploy-acceptor" {
  transit_gateway_attachment_id = hcp_aws_transit_gateway_attachment.deploy_attach.provider_transit_gateway_attachment_id
}
