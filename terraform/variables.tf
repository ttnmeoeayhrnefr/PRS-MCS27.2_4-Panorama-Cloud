variable "allowed_ssh_ips" {
  description = "List of IP addresses allowed to SSH to admin instance"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}