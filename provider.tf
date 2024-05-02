terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

provider "digitalocean" {
  token = var.token
}

data "digitalocean_ssh_key" "terraform" {
  name = "terraform"
}