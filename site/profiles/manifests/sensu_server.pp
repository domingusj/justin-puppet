#sensu server
class profiles::sensu_server {

  include profiles::firewall::web_fw

  class { 'sensu': }

}