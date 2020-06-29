resource "digitalocean_droplet" "vm3" {
  image  = "ubuntu-18-04-x64"
  name   = "vm3"
  region = "fra1"
  size   = "512mb"
  vpc_uuid = data.digitalocean_vpc.default-fra1.id
  ssh_keys = [
    var.ssh_fingerprint,
  ]

  connection {
    type        = "ssh"
    host        = self.ipv4_address
    user        = "root"
    private_key = file(var.pvt_key)
    timeout     = "2m"
  }
}

output "ip_vm3" {
    value = "${digitalocean_droplet.vm3.ipv4_address}"
}

output "private_ip_vm3" {
    value = "${digitalocean_droplet.vm3.ipv4_address_private}"
}