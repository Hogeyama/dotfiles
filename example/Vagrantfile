# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure("2") do |config|
  config.vm.box = "debian/stretch64"
  config.vm.synced_folder "C:\\", "/c"
  name = "main-vm"
  config.vm.define name, primary: true do |cfg|
    cfg.vm.hostname = name
    cfg.vm.network "private_network", ip: "10.10.10.10"
    cfg.vm.network "forwarded_port", guest: 8081, host: 8081
    cfg.vm.network "forwarded_port", guest: 22, host: 2200
    cfg.vm.provider "virtualbox" do |vb|
      vb.memory = "4096"
      vb.customize ["modifyvm", :id, "--vram", "32", '--clipboard', 'bidirectional']
      vb.name = name
    end
    cfg.vm.provision "ansible_local" do |ansible|
      ansible.playbook = "playbook.yml"
      ansible.install_mode = "pip"
      ansible.pip_install_cmd = "curl -s https://bootstrap.pypa.io/get-pip.py | sudo python3"
      ansible.extra_vars = { ansible_python_interpreter:"/usr/bin/python3" }
    end
  end
end
