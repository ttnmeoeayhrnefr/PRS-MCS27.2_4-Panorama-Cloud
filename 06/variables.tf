variable "github_token" {
  description = "GitHub Personal Access Token"
  type        = string
  sensitive   = true
}

variable "nom_du_repo" {
  description = "Nom du dépôt GitHub"
  type        = string
}