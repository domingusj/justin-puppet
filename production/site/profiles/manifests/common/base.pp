# base profile everyone gets

class profiles::common::base {

  class { 'motd':
    content => "# This node is managed by Puppet ${::clientversion}\n# Environment: ${env}\n# Location: ${location}\n"
  }

  package { 'software-properties-common':
    ensure => installed,
  }

  # common users
  users { 'common': }

  class { '::ntp': }

  # set locale
  class { 'locales':
      default_locale => 'en_US.UTF-8',
      locales        => ['en_US.UTF-8 UTF-8'],
  }

  # base firewall config
  include profiles::firewall::setup

}
