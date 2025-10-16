# README - Makefile Principal

## Description
Ce Makefile principal simplifie la gestion de l'infrastructure Panorama Cloud en orchestrant les commandes Terraform et AWS CLI.

## Prérequis
- Système d'exploitation : Ubuntu 24.04 LTS (Noble Numbat) - À jour au 16 octobre 2025
- Accès sudo
- Accès Internet pour télécharger les dépendances
- Fichier `./docs/admin.pem` présent dans le projet

## Commandes Disponibles

### `make install`
Installation complète de l'environnement de travail.

**Cette commande va :**
- Installer Terraform via le dépôt officiel HashiCorp
- Installer ou mettre à jour AWS CLI v2
- Configurer les permissions du fichier `admin.pem` (chmod 600)
```bash
make install
```

### `make configure`
Configuration interactive des credentials AWS.

Lance l'assistant de configuration AWS CLI qui vous demandera :
- AWS Access Key ID
- AWS Secret Access Key
- Région par défaut
- Format de sortie par défaut
```bash
make configure
```

### `make configure-aws_session_token`
Configuration du token de session AWS (pour authentification MFA ou temporaire).
```bash
make configure-aws_session_token aws_session_token=VOTRE_TOKEN
```

### `make tp`
Raccourci pour l'exécution complète du workflow Terraform (Init, Plan, Apply).

Cette commande lance séquentiellement :
1. `terraform init` - Initialisation du backend Terraform
2. `terraform plan` - Prévisualisation des changements
3. `terraform apply -auto-approve` - Application automatique des changements
```bash
make tp
```

## Workflow Typique
```bash
# 1. Installation initiale (une seule fois)
make install

# 2. Configuration AWS (une seule fois ou au changement de credentials)
make configure

# 3. Déploiement de l'infrastructure
make tp
```

## Structure du Projet
```
.
├── Makefile (ce fichier)
├── terraform/
│   └── Makefile (voir README terraform)
└── docs/
    └── admin.pem (clé SSH - ne pas commiter!)
```

## Notes Importantes
⚠️ Ne jamais commiter le fichier `admin.pem` dans le gestionnaire de versions.