#sensu server
class profiles::sensu_server {

  firewall {'100 allow uwicha 3000':
    dport  => '3000',
    proto  => 'tcp',
    action => 'accept',
    source => hiera('private_network'),
  }

  class { 'sensu':
    plugins => [
      'puppet:///data/sensu/plugins/ntp.rb',
      'puppet:///data/sensu/plugins/postfix.rb'
    ],
  }

  sensu::handler { 'default':
    command => 'mail -s \'sensu alert\' domingusj@gmail.com.com',
  }

  sensu::check { 'check_ntp':
    command     => 'PATH=$PATH:/usr/lib/nagios/plugins check_ntp_time -H pool.ntp.org -w 30 -c 60',
    handlers    => 'default',
    subscribers => 'sensu-test',
  }

  include 'erlang'

  package { 'erlang-base':
    ensure => 'latest',
  }

}
