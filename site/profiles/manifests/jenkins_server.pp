#jenkins server
class profiles::jenkins_server {

$private_network = hiera ('private_network')

  include jenkins
  jenkins::plugin { 'git': }

  firewall { '200 web 8080':
    dport  => '8080',
    proto  => 'tcp',
    action => 'accept',
    source => $private_network,
  }



}
