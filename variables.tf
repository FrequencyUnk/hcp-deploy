variable "hvn_id" {
  description = "The ID of the HCP HVN."
  type        = string
  default     = "Deploy-HCP-Demo"
}

variable "cluster_id" {
  description = "The ID of the HCP Vault cluster."
  type        = string
  default     = "HCP-Vault-Cluster"
}

variable "cluster_id" {
  description = "The ID of the HCP Consul cluster."
  type        = string
  default     = "HCP-Consul-Cluster"
}

variable "peering_id" {
  description = "The ID of the HCP peering connection."
  type        = string
  default     = "Deploy-HCP-Peering"
}

variable "route_id" {
  description = "The ID of the HCP HVN route."
  type        = string
  default     = "Deploy-HCP-HVN-Route"
}

variable "region" {
  description = "The region of the HCP HVN and Vault cluster."
  type        = string
  default     = "us-west-2"
}

variable "cloud_provider" {
  description = "The cloud provider of the HCP HVN and Vault cluster."
  type        = string
  default     = "aws"
}

variable "vault_tier" {
  description = "Tier of the HCP Vault cluster. Valid options for tiers."
  type        = string
  default     = "dev"
}

variable "consul_tier" {
  description = "Tier of the HCP Consul cluster. Valid options for tiers."
  type        = string
  default     = "dev"
}
