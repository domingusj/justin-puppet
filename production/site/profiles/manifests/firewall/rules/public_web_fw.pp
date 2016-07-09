#allows 80 and 443 for public webservers
class profiles::firewall::rules::public_web_fw {

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
