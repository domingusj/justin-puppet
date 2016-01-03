#DNS server
class profiles::dns_server {

  package { 'tmux':
    ensure => installed,
  }

}
