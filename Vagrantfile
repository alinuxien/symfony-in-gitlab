# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.define "gitlab-vieillot" do |gitlab|
    gitlab.vm.box = "hashicorp/bionic64"
    gitlab.vm.box_version = "1.0.282"
    gitlab.vm.hostname = "gitlab.example.com"
    gitlab.vm.network "forwarded_port", guest: 80, host: 8080
    gitlab.vm.network "forwarded_port", guest: 4443, host: 4443
    gitlab.vm.network "private_network", ip: "192.168.34.30"
    gitlab.vm.provider "virtualbox" do |v|
      v.name = "gitlab-vieillot"
      v.memory = 8192
      v.cpus = 8
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      v.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
      v.customize [ "guestproperty", "set", :id, "/VirtualBox/GuestAdd/VBoxService/--timesync-set-threshold", 10000 ]
    end
    gitlab.vm.provision :shell, path: "bootstrap.sh"
    gitlab.vm.provision :shell, path: "auto_cd_gitlab.sh"
  end

  config.vm.define "recette-vieillot" do |recette|
    recette.vm.box = "debian/buster64"
    recette.vm.box_version = "10.4.0"
    recette.vm.box_check_update = false
    recette.vm.hostname = "recette"
    recette.vm.network "forwarded_port", guest: 8000, host: 8010
    recette.vm.network "private_network", ip: "192.168.34.10"
    recette.vm.synced_folder "./recette", "/home/vagrant/recette", type: "nfs", nfs_version: 4, nfs_udp: false 
    recette.vm.provider "virtualbox" do |v|
      v.name = "recette-vieillot"
      v.memory = 2048
      v.cpus = 2
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      v.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
      v.customize [ "guestproperty", "set", :id, "/VirtualBox/GuestAdd/VBoxService/--timesync-set-threshold", 10000 ]
    end
    recette.vm.provision :shell, path: "bootstrap_vieillot.sh"
    recette.vm.provision :shell, path: "auto_cd_recette.sh"
  end

  config.vm.define "production-vieillot" do |production|
    production.vm.box = "debian/buster64"
    production.vm.box_version = "10.4.0"
    production.vm.box_check_update = false
    production.vm.hostname = "production"
    production.vm.network "forwarded_port", guest: 8000, host: 8081
    production.vm.network "private_network", ip: "192.168.34.20"
    production.vm.synced_folder "./production", "/home/vagrant/production", type: "nfs", nfs_version: 4, nfs_udp: false
    production.vm.provider "virtualbox" do |v|
      v.name = "production-vieillot"
      v.memory = 2048
      v.cpus = 2   
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      v.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
      v.customize [ "guestproperty", "set", :id, "/VirtualBox/GuestAdd/VBoxService/--timesync-set-threshold", 10000 ]
    end
    production.vm.provision :shell, path: "bootstrap_vieillot.sh"
    production.vm.provision :shell, path: "auto_cd_production.sh"
  end
end

