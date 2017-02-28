#Icinga server
class profiles::icinga_server {

  $icinga_db_pw = hiera ('icinga_db_pw')

  include profiles::firewall::web_fw

  include icingaweb2


  class { 'postgresql::server': }

  postgresql::server::db { 'icinga2_data':
    user     => 'icinga2',
    password => postgresql_password('icinga2', $icinga_db_pw),
  }

}
