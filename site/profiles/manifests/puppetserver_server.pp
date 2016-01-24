#Puppetserver server
class profiles::puppetserver_server {

  firewall { '100 puppet 8140':
    dport  => '8140',
    proto  => 'tcp',
    action => 'accept',
  }

  firewall { '101 foreman 443':
      dport  => '443',
      proto  => 'tcp',
      action => 'accept',
  }

    class { '::puppet':
      server                      => true,
      server_implementation       => 'puppetserver',
      server_environments         => [],
      server_puppetdb_host        => hiera('puppetdb_server'),
      server_reports              => 'puppetdb,foreman',
      server_storeconfigs_backend => 'puppetdb',

  }

}
