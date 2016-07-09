#apache server
class profiles::apache_server {

  class { 'apache': }

  include profiles::firewall::rules::private_web_fw

}
