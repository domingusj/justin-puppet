#allows 80 and 443 for private webservers
class profiles::firewall::rules::private_web_fw {

  $private_network = hiera ('private_network')

  firewall {'100 private web 80':
      dport  => '80',
      proto  => 'tcp',
      action => 'accept',
      source => $private_network,
  }

  firewall {'101 private web 443':
    dport  => '443',
    proto  => 'tcp',
    action => 'accept',
    source => $private_network,
  }

}
