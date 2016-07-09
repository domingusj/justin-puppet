#Puppet agent conf
class profiles::puppet_agent {

  class { '::puppet':
    server                      => false,
    server_reports              => 'puppetdb',
    server_storeconfigs_backend => 'puppetdb',
  }

}
