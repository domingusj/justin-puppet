#foreman server
class profiles::foreman_server {

include profiles::firewall::web_fw

  class { 'foreman': }

}
