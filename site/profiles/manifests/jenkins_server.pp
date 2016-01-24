#jenkins server
class profiles::jenkins_server {

  $private_network = hiera ('private_network')

  class { 'jenkins':
    configure_firewall => true,
    port               => '8880',
  }

}
