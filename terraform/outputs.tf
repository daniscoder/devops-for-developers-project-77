output "droplet_ips" {
  value = digitalocean_droplet.web[*].ipv4_address
}

output "load_balancer_ip" {
  value = digitalocean_loadbalancer.web.ip
}

output "database_host" {
  value     = digitalocean_database_cluster.db.host
  sensitive = true
}
