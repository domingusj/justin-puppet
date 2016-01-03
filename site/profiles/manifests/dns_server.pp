#DNS server
class profiles::dns_server {

  package { 'tmux':
    ensure => installed,
  }

  firewall {'005 dns 53':
      dport  => '53',
      proto  => 'udp',
      action => 'accept',
  }

}
