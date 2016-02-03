VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  add_server("10.2.0.5", "core1.dev.justindomingus.com", "ubuntu", config,)
  add_server("10.2.0.6", "core2.dev.justindomingus.com", "ubuntu", config,)
  add_server("10.2.0.10", "puppet1.dev.justindomingus.com", "ubuntu", config,)
end

def add_server(ip, hostname, distro, config, port_forwards = [])
  config.vm.define hostname.split('.').first.to_sym do |p|

    if distro == 'ubuntu'
      p.vm.box = "puppetlabs/ubuntu-14.04-64-puppet"
    elsif distro == 'centos'
      p.vm.box = "puppetlabs/centos-7.0-64-puppet"
    end

    p.vm.network "private_network", ip: ip
    p.vm.provider :virtualbox do |vb|
      # to enable a console session uncomment this e.g. if you lock yourself out
      # vb.gui = true
      if hostname =~ /^puppet.*/
        vb.customize ["modifyvm", :id, "--memory", 4096]
        vb.customize ["modifyvm", :id, "--cpus", 2]
      else
        vb.customize ["modifyvm", :id, "--memory", 1024]
        vb.customize ["modifyvm", :id, "--cpus", 2]
      end
    end

    p.vm.synced_folder ".", "/vagrant"

    port_forwards.each do |pf|
      guest_port, host_port, protocol = pf
      config.vm.network :forwarded_port, guest: guest_port, host: host_port, :protocol  => protocol
    end

    p.vm.provision :shell, :inline => $populate_hosts

    if hostname =~ /^puppet.*/
      p.vm.provision :shell, :inline => $prep_puppetmaster
      p.vm.provision :puppet do |puppet|
        puppet.manifests_path = "puppet/environments/production/manifests"
        puppet.manifest_file  = "site.pp"
        puppet.hiera_config_path = "vagrant_hiera.yaml"
        # TODO: Use relative paths in hiera.yaml so we can use a common file for vagrant/non-vagrant

        puppet.facter = {
          "vagrant_apply_bootstrap" => "1"
        }

        puppet.options = '--debug --verbose'
        # puppet.options = '--verbose --debug --trace'
      end
      p.vm.provision :shell, :inline => $cleanup_apply_report
    else
      p.vm.provision "puppetserver_server" do |puppet|
        puppet.puppet_server = "puppet1.dev.justindomingus.com"
        puppet.puppet_node = hostname
        puppet.options = '--debug --verbose'
        puppet.facter = {
          "vagrant_agent_bootstrap" => "1"
        }
      end
    end
  end

  end
