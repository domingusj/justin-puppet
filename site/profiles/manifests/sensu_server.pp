#sensu server
class profiles::sensu_server {

  firewall {'100 allow uwicha 3000':
    dport  => '3000',
    proto  => 'tcp',
    action => 'accept',
    source => hiera('private_network'),
  }

  class { 'sensu': }

  include 'erlang'

  package { 'erlang-base':
    ensure => 'latest',
  }

}
