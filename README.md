## Usage

- `cp example/inventory.yml ./inventory.yml`
- Edit `inventory.yml`
- `ansible-playbook playbook.yml -i inventory.yml`

### With Vagrant

- `cp example/Vagrantfile example/ansible.cfg ./`
- Edit Vagrantfile
- `vagrant plugin install vagrant-vbguest`
- `vagrant plugin install vagrant-disksize`
- `vagrant up`

