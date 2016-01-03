#Graphite server
class profiles::graphite_server {

include profiles::firewall::web_fw

  class { 'graphite': }

}
