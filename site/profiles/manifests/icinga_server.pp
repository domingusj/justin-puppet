#Icinga server
class profiles::icinga_server {

  include icingaweb2

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
