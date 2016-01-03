#base profile everyone gets

class profile::base {

  # common users
  users { 'common': }

  class { '::ntp': }

  # set locale
  class { 'locales':
      default_locale => 'en_US.UTF-8',
      locales        => ['en_US.UTF-8 UTF-8'],
  }

  # base firewall config
  include profile::firewall::setup

  # common packages needed everywhere
  package {[
          'vim',
          'sudo',
          'screen',
          'tree',
          'htop'
      ]:
      ensure => present,
  }

}
