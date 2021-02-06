
## Usage

- `cp example/inventory-${DIST}.yml ./inventory.yml`
- Edit `inventory.yml`
- `ansible-playbook playbook.yml -i inventory.yml`

### With Vagrant

- `cp example/Vagrantfile example/ansible.cfg ./`
- Edit Vagrantfile
- `vagrant plugin install vagrant-disksize`
- `vagrant up`

