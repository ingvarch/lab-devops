provider "digitalocean" {
  # export DIGITALOCEAN_TOKEN=....
  version = "~> 1.12.0"
}

provider "tls" {
  version = "~> 2.1"
}

provider "null" {
  version = "~> 2.1"
}
