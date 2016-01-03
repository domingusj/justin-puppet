#base profile everyone gets

class profiles::base {

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

  #common packages needed everywhere
  package {[
          'vim',
          'git',
          'sudo',
          'screen',
          'tree',
          'htop'
      ]:
      ensure => present,
  }

}
