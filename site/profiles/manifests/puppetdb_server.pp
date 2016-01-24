#Puppetdb server
class profiles::puppetdb_server {

  class { 'puppetdb':
    manage_firewall => true,
  }

  include ::puppetdb::master::config

}
