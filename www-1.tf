resource "digitalocean_droplet" "www-1" {
  image = "ubuntu-22-04-x64"
  name = "web-server-12321"
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
  
  provisioner "remote-exec" {
    inline = [
      "export PATH=$PATH:/usr/bin",
      "sudo apt update",
      "sudo apt install -y nginx",
      "sleep 1"
    ]
  }
}