VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  add_server("10.2.0.5", "core1.dev.den.justindomingus.com", "ubuntu", config,)
  add_server("10.2.0.10", "puppet1.dev.den.justindomingus.com", "ubuntu", config,)
end

def add_server(ip, hostname, distro, config, port_forwards = [])
  config.vm.define hostname.split('.').first.to_sym do |host_config|
      config.vm.hostname = hostname

    if distro == 'ubuntu'
      host_config.vm.box = "puppetlabs/ubuntu-14.04-64-puppet"
    elsif distro == 'centos'
      host_config.vm.box = "puppetlabs/centos-7.0-64-puppet"
    end

    host_config.vm.network "private_network", ip: ip
    host_config.vm.provider :virtualbox do |vb|

      if hostname =~ /^puppet.*/
        vb.customize ["modifyvm", :id, "--memory", 3072]
        vb.customize ["modifyvm", :id, "--cpus", 2]
      else
        vb.customize ["modifyvm", :id, "--memory", 1024]
        vb.customize ["modifyvm", :id, "--cpus", 2]
      end
    end

    host_config.vm.synced_folder ".", "/vagrant"

    port_forwards.each do |pf|
      guest_port, host_port, protocol = pf
      config.vm.network :forwarded_port, guest: guest_port, host: host_port, :protocol  => protocol
    end

    # Shell provision - ubuntu only
    if hostname =~ /^puppet.*/
      host_config.vm.provision "shell", inline: <<-SHELL
        sudo apt-get -y update
        sudo apt-get -y install git
        sudo /opt/puppetlabs/puppet/bin/gem install r10k
        sudo git clone https://github.com/domingusj/justin-puppet-ctrl.git
        cd /home/vagrant/justin-puppet-ctrl
        sudo /opt/puppetlabs/puppet/bin/r10k deploy environment -p -v
        SHELL
      host_config.vm.provision "puppet" do |puppet|
        puppet.manifest_file = "site.pp"
        puppet.hiera_config_path = "hiera.yaml"
        puppet.options = '--debug --verbose'
        puppet.facter = { "vagrant_bootstrap" => "1" }
    else
      host_config.vm.provision "puppet" do |puppet|
        puppet.puppet_server = "puppet1.dev.den.justindomingus.com"
        puppet.manifest_file = "site.pp"
        puppet.hiera_config_path = "hiera.yaml"
        puppet.options = '--debug --verbose'
        puppet.facter = { "vagrant_bootstrap" => "1" }
      end
  end
end
