#Icinga server
class profiles::icinga_server {

  include profiles::firewall::web_fw
  
  include icingaweb2

}
