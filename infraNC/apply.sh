#!/bin/bash

terraform apply -auto-approve \
        -target=digitalocean_droplet.vm2 \
        -target=digitalocean_droplet.vm3 \
        -target=digitalocean_droplet.vm4

mkdir -p out
: >out/hosts.txt
echo "vm2 ansible_host=$(terraform output private_ip_vm2)" >> out/hosts.txt
echo "vm3 ansible_host=$(terraform output private_ip_vm3)" >> out/hosts.txt
echo "vm4 ansible_host=$(terraform output private_ip_vm4)" >> out/hosts.txt

terraform apply -auto-approve \
        -target=digitalocean_droplet.vm1
