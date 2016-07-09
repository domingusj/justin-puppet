#Puppetserver server
class profiles::puppetserver_server {

  class { 'puppetserver::repository': } ->
  class { 'puppetserver': }

  # firewall rules
  firewall { '100 puppet 8140':
    dport  => '8140',
    proto  => 'tcp',
    action => 'accept',
  }

  include profiles::firewall::web_fw

}
