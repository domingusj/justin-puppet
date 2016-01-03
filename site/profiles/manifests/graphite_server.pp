#Graphite server
class profiles::graphite_server {

  class { 'graphite': }

  firewall {'100 web 80':
      dport  => '80',
      proto  => 'tcp',
      action => 'accept',
  }

  firewall {'101 web 443':
      dport  => '443',
      proto  => 'tcp',
      action => 'accept',
  }

}
