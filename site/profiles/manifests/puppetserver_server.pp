#Puppetserver server
class profiles::puppetserver_server {

  class { '::puppet':
    server                => true,
    server_implementation => 'puppetserver',
    server_foreman        => false,
  }

  # firewall rules
  firewall { '100 puppet 8140':
    dport  => '8140',
    proto  => 'tcp',
    action => 'accept',
  }

  include profiles::firewall::web_fw

}
