data "digitalocean_ssh_key" "default" {
  name = "terraform"
}

resource "digitalocean_droplet" "web" {
  count    = 2
  name     = "web-tf-${count.index + 1}"
  size     = "s-1vcpu-1gb"
  image    = "ubuntu-24-04-x64"
  region   = "nyc1"
  tags     = ["web"]
  ssh_keys = [data.digitalocean_ssh_key.default.id]
}

resource "digitalocean_domain" "default" {
  name = "daniscoder.online"
}

resource "digitalocean_record" "default" {
  domain = digitalocean_domain.default.name
  type   = "A"
  name   = "@"
  value  = digitalocean_loadbalancer.web.ip
}

resource "digitalocean_certificate" "default" {
  name    = "daniscoder-online-cert"
  type    = "lets_encrypt"
  domains = ["daniscoder.online"]
}

resource "digitalocean_loadbalancer" "web" {
  name        = "web-lb-tf"
  region      = "nyc1"
  droplet_tag = "web"

  forwarding_rule {
    entry_port      = 80
    entry_protocol  = "http"
    target_port     = 80
    target_protocol = "http"
  }

  forwarding_rule {
    entry_port       = 443
    entry_protocol   = "https"
    target_port      = 80
    target_protocol  = "http"
    certificate_name = digitalocean_certificate.default.name
  }

  healthcheck {
    port     = 80
    protocol = "http"
    path     = "/"
  }
}

resource "digitalocean_database_cluster" "db" {
  name       = "web-db-tf"
  engine     = "pg"
  version    = "16"
  size       = "db-s-1vcpu-1gb"
  region     = "nyc1"
  node_count = 1
}

resource "digitalocean_database_firewall" "db" {
  cluster_id = digitalocean_database_cluster.db.id

  rule {
    type  = "tag"
    value = "web"
  }
}
