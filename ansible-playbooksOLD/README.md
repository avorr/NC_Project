## Ansible playbooks

### Files

- `ansible.cfg` - config file
- `hosts.txt` - inventory file with ip vm
- `wildfly.yml` - ansible playbook for install wildfly

### How-to

#### Start playbook

- Check exist ip at `hosts.txt`
- Start playbook:
```
ansible-playbook <playbook name>
```

#### Create role from playbook

Create role catalog structure at `/roles`:

```
ansible-galaxy init <role_name>
```
### Addresses

- `vm2:9990` - WildFly
- `vm2:8080` - LifeRay
- `vm3:5432` - Postgres
- `vm4:9090` - Prometheus
- `vm4:3000` - Grafana
- `vm4:9187` - Postgres Exporter