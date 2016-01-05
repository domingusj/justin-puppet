#jenkins server
class profiles::jenkins_server {

  $private_network = hiera ('private_network')

  class { 'jenkins':
    configure_firewall => true,
    config_hash        => {
      'HTTP_PORT' => { 'value' => '9090' },
       'AJP_PORT' => { 'value' => '9009' }
    },
  }

}
