resource "digitalocean_droplet" "backend-1" {
    image = "ubuntu-22-04-x64"
    name = "my-backend"
    region = "fra1"
    size = "s-2vcpu-2gb"
    ssh_keys = [
        data.digitalocean_ssh_key.terraform.id
    ]

    connection {
        host = self.ipv4_address
        user = "root"
        type = "ssh"
        private_key = var.pvt_key
        timeout = "2m"
    }

    provisioner "file" {
    source      = "./nginx"
    destination = "/app/"
  }

  provisioner "remote-exec" {
    inline = [
      "export PATH=$PATH:/usr/bin",
      "sudo apt update",
      "apt install -y docker-compose",
      "sleep 10"
    ]
  }

  provisioner "remote-exec" {
    inline = [
      "cd /app",
      "docker-compose up -d"
    ]
  }
}