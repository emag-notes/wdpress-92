# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  # cache
  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :box
  end

  # common
  config.vm.box = "centos71"
  config.vm.box_url = "https://github.com/CommanderK5/packer-centos-template/releases/download/0.7.1/vagrant-centos-7.1.box"

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "2048"]
  end

  config.vm.provision :shell do |shell|
    shell.path = "./provisioning/common/proxy.sh"
    shell.args = ""
  end

  config.vm.provision :shell, :path => "./provisioning/common/uninstall-packages.sh"
  config.vm.provision :shell, :path => "./provisioning/common/fast-mirror.sh"
  config.vm.provision :shell, :path => "./provisioning/common/yum-update.sh"
  config.vm.provision :shell, :path => "./provisioning/common/install-packages.sh"
  config.vm.provision :shell, :path => "./provisioning/common/timezone.sh"
  config.vm.provision :shell, :path => "./provisioning/common/localeconf.sh"
  config.vm.provision :shell, :path => "./provisioning/common/ntp.sh"
  config.vm.provision :shell, :path => "./provisioning/common/disable-firewalld.sh"

  # app
  config.vm.define :app do |app|
    app.vm.hostname = "app"
    app.vm.network "private_network", ip: "192.168.101.10"
    app.vm.provision :shell, :path => "./provisioning/app/install-packages.sh"
    app.vm.provision :shell, :path => "./provisioning/app/setup.sh"
  end

end
