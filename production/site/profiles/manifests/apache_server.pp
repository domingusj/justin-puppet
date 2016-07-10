#apache server
class profiles::apache_server {

  class { 'apache':
    require => Class['apt::update']
  }

  include profiles::firewall::rules::private_web_fw

}
