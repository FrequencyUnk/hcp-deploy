resource "hcp_hvn" "deploy_hcp_hvn" {
  hvn_id         = var.hvn_id
  cloud_provider = var.cloud_provider
  region         = var.region
}

resource "hcp_vault_cluster" "deploy_hcp_vault" {
  hvn_id     = hcp_hvn.deploy_hcp_hvn.hvn_id
  cluster_id = var.vault_cluster_id
  tier       = var.vault_tier
  public_endpoint = true
}

resource "hcp_consul_cluster" "deploy_hcp_consul" {
  hvn_id          = hcp_hvn.deploy_hcp_hvn.hvn_id
  cluster_id      = var.consul_cluster_id
  tier            = "development"
  public_endpoint = true
}
