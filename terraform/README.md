# README - Makefile Terraform

## Description
Ce Makefile gère l'installation des outils nécessaires et l'exécution des commandes Terraform pour le déploiement de l'infrastructure.

## Prérequis
- Système d'exploitation : Ubuntu 24.04 LTS (Noble Numbat) - À jour au 16 octobre 2025
- Accès sudo
- Accès Internet

## Commandes d'Installation

### `make install-terraform`
Installation de Terraform depuis le dépôt officiel HashiCorp.

**Étapes réalisées :**
1. Mise à jour des packages système
2. Installation des dépendances (gnupg, software-properties-common)
3. Téléchargement et installation de la clé GPG HashiCorp
4. Ajout du dépôt HashiCorp (compatible Ubuntu 24.04)
5. Installation de Terraform
6. Vérification de la version installée
```bash
make install-terraform
```

### `make install-aws`
Installation ou mise à jour d'AWS CLI v2.

**Fonctionnement intelligent :**
- Détecte si AWS CLI est déjà installé
- Si oui : effectue une mise à jour
- Si non : effectue une installation complète
- Nettoie automatiquement les fichiers temporaires
```bash
make install-aws
```

## Commandes de Configuration

### `make configure-aws`
Lance la configuration interactive d'AWS CLI.
```bash
make configure-aws
```

### `make configure-aws_session_token`
Définit un token de session AWS pour l'authentification temporaire.
```bash
make configure-aws_session_token aws_session_token=VOTRE_TOKEN_ICI
```

**Exemple :**
```bash
make configure-aws_session_token aws_session_token=IQoJb3JpZ2luX2VjEDoa...
```

## Commandes Terraform

### `make ipa`
**Workflow complet** - Alias pour `init`, `plan` et `apply` en séquence.
```bash
make ipa
```

### `make init`
Initialise le répertoire de travail Terraform.
```bash
make init
```

### `make plan`
Génère un plan d'exécution Terraform (prévisualisation des changements).
```bash
make plan
```

### `make apply`
Applique les changements d'infrastructure avec approbation automatique.

⚠️ **Attention :** Cette commande utilise `-auto-approve` et n'attend pas de confirmation.
```bash
make apply
```

### `make destroy`
Détruit toute l'infrastructure gérée par Terraform avec approbation automatique.

⚠️ **DANGER :** Cette commande supprime définitivement les ressources sans confirmation.
```bash
make destroy
```

## Workflows Recommandés

### Première utilisation
```bash
make install-terraform
make install-aws
make configure-aws
make init
```

### Déploiement standard
```bash
make ipa
```

### Vérification sans modification
```bash
make plan
```

### Destruction de l'infrastructure
```bash
# Vérifiez d'abord ce qui sera détruit
terraform plan -destroy

# Puis détruisez
make destroy
```

## Variables d'Environnement

Si vous utilisez des tokens de session AWS, vous pouvez les passer comme paramètre :
```bash
make configure-aws_session_token aws_session_token=$(cat token.txt)
```

## Dépannage

### Problème de permissions
Si l'installation échoue, vérifiez vos droits sudo :
```bash
sudo -v
```

### AWS CLI ne se met pas à jour
Supprimez manuellement l'ancienne installation :
```bash
sudo rm -rf /usr/local/aws-cli
sudo rm /usr/local/bin/aws
make install-aws
```

### Terraform init échoue
Vérifiez votre configuration AWS :
```bash
aws sts get-caller-identity
```

### Problème avec lsb_release
Sur Ubuntu 24.04, si vous rencontrez des erreurs avec `lsb_release`, installez le package :
```bash
sudo apt-get install lsb-release
```

## Notes de Sécurité

- Les commandes `apply` et `destroy` utilisent `-auto-approve` : soyez vigilant
- Ne partagez jamais vos credentials AWS
- Utilisez des tokens de session pour une sécurité accrue
- Révoquez les accès inutilisés régulièrement