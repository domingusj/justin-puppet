# rabbitmq server

class profiles::rabbitmq_server {

  class { '::rabbitmq':
    package_ensure    => 'latest',
    service_manage    => true,
    port              => '5672',
    delete_guest_user => true,
  }

}
