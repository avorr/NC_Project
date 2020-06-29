resource "digitalocean_droplet" "vm1" {
  image  = "ubuntu-18-04-x64"
  name   = "vm1"
  region = "fra1"
  size   = "2gb"
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
  
  provisioner "file" {
    source      = "~/.ssh/id_rsa"
    destination = "~/.ssh/id_rsa"
  }

  provisioner "file" {
    source      = "~/.ssh/cli"
    destination = "~/.ssh/cli"
  }

  provisioner "file" {
    source      = "out/hosts.txt"
    destination = "~/hosts.txt"
  }

  provisioner "file" {
    source      = "out/ssh-credentials.xml"
    destination = "~/.ssh/sshcredentials.xml"
  }

  provisioner "remote-exec" {
    inline = [
      "export PATH=$PATH:/usr/bin",
      "apt update",
      "chmod 400 ~/.ssh/id_rsa",
      "apt install -y software-properties-common",
      "apt-add-repository --yes --update ppa:ansible/ansible",
      "apt install -y ansible",
      "GIT_SSH_COMMAND='ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no' git clone git@gitlab.com:nc-devops/ansible-playbooks.git",     
      "cp ~/.ssh/sshcredentials.xml ~/ansible-playbooks/roles/install_jenkins/files/.",
      "cp ~/hosts.txt ~/ansible-playbooks/roles/install_jenkins/files/.",
      "cp ~/.ssh/id_rsa ~/ansible-playbooks/roles/install_jenkins/files/.",
      "ansible-playbook -i localhost ansible-playbooks/jenkins.yml"
    ]
  }
}

output "ip_vm1" {
    value = "${digitalocean_droplet.vm1.ipv4_address}"
}

output "private_ip_vm1" {
    value = "${digitalocean_droplet.vm1.ipv4_address_private}"
}