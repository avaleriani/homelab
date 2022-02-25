terraform {
  backend "kubernetes" {
    secret_suffix     = "random-secrets"
    # in_cluster_config = true
  }
}
