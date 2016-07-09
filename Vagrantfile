# -*- mode: ruby -*-
# # vi: set ft=ruby :

# Specify minimum Vagrant version and Vagrant API version
Vagrant.require_version ">= 1.6.0"
VAGRANTFILE_API_VERSION = "2"

# Require YAML module
require 'yaml'

# Read YAML file with box details
servers = YAML.load_file('servers.yaml')

# Create boxes
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.landrush.enabled = true
  # Iterate through entries in YAML file
  servers.each do |servers|
    config.vm.define servers["name"] do |srv|
      srv.vm.box = servers["box"]
      srv.vm.hostname = servers["name"]
      srv.vm.network "private_network", ip: servers["ip"]
      srv.vm.provider :virtualbox do |vm|
        vm.name = servers["name"]
        vm.memory = servers["ram"]
        vm.cpus = servers["cpus"]
      end
      config.landrush.tld = "dev.den.justindomingus.com"
      config.vm.provision "puppet" do |puppet|
        #puppet.options = "--verbose --debug"
        puppet.environment_path = "."
        puppet.environment = "production"
        puppet.hiera_config_path = "production/hiera.yaml"
      end
    end
  end
end
