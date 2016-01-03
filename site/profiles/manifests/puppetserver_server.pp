#Puppetserver server
class profiles::puppetserver_server {

  firewall { '100 puppet 8140':
    dport  => '8140',
    proto  => 'tcp',
    action => 'accept',
  }


}
