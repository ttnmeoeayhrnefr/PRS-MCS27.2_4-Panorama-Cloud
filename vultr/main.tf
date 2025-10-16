resource "vultr_instance" "wordpress" {
  region = "fra"                   # Francfort (rapide pour l'Europe)
  plan = "vc2-1c-1gb"              # 1 vCPU, 1Go RAM
  os_id = 1743                     # Ubuntu 22.04 x64
  label = "wordpress-demo"
  enable_ipv6 = false
  backups = "disabled"
  hostname = "wordpress-tf"
}

output "ip_address" {
  value = vultr_instance.wordpress.main_ip
}