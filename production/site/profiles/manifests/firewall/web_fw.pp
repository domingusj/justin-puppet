#allows 80 and 443 for webservers
class profiles::firewall::web_fw {

$private_network = hiera ('private_network')

  firewall {'100 web 80':
      dport  => '80',
      proto  => 'tcp',
      action => 'accept',
      source => $private_network,
  }

  firewall {'101 web 443':
    dport  => '443',
    proto  => 'tcp',
    action => 'accept',
    source => $private_network,
  }

}
