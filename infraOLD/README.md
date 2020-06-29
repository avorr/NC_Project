# NC-DevOps Infra
## VMs
1. Java & Tomcat & Jenkins & Ansible
1. Wildfly & Liferay
1. PostgreSQL
1. Prometheus & Grafana

## Files

* `provider.tf` - provider settings
* `vm1.tf` - settings for Droplet vm1

## How-to
#### Pre-configuration
1. First of all write 4 env. variables that starts with TF_VAR to your rc file (`$HOME/.bashrc` or `$HOME/.zshrc`)
    ```shell
    export TF_VAR_do_token="**WRITE_YOUR_TOKEN_HERE**"
    export TF_VAR_pub_key="$HOME/.ssh/id_rsa.pub"
    export TF_VAR_pvt_key="$HOME/.ssh/id_rsa"
    export TF_VAR_ssh_fingerprint="**WRITE_YOUR_FINGERPRINT_HERE**"
    ```

1. Then prepare SSH-credentials `ssh-credentials.xml` and put it to out/ directory. 
It will be used by vm1.

1. After that install digital-ocean provider plugin
    ```shell
    terraform init
    ```

1. To start the automation flow, execute `./apply.sh`

1. To destroy all machines, run `./destroy.sh`


#### Tips
You can check that everything in our configuration file correct before applying it to DigitalOcean cloud
```shell
terraform plan
```

If everything is correct - you can apply the configuration and take pleasure in automation
```shell
terraform apply
```

To auto-approve use special flag
```shell
terraform apply -auto-approve
```

To apply a specific Droplet use
```shell
terraform apply -target=digitalocean_droplet.vm2
```

To output any variables write
```shell
terraform output ip_vm2
```

## Useful links
* [how-to-use-terraform-with-digitalocean](https://www.digitalocean.com/community/tutorials/how-to-use-terraform-with-digitalocean)