locals {
  random_passwords = [
    "gitea-admin-password"
  ]
}

resource "random_password" "passwords" {
  for_each = toset(local.random_passwords)
  length   = 32
  special  = false
}

resource "kubernetes_secret" "gitea_admin_secret" {
  metadata {
    name = "gitea-admin-secret"
    namespace = "gitea"
  }

  data = {
    username = "gitea_admin"
    password = random_password.passwords["gitea-admin-password"].result
  }
}
