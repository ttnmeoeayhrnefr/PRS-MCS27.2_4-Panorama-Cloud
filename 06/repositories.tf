resource "github_repository" "mon_repo" {
  name        = var.nom_du_repo
  description = "Créé avec Terraform"
  visibility  = "private"
}