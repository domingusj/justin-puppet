#base profile everyone gets

class profiles::base {

  include apt

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

  apt::ppa { 'ppa:brightbox/ruby-ng':
    notify  => Exec['apt_update'],
    require => Package['software-properties-common'],
  }
  #common packages needed everywhere
  package {[
          'vim',
          'curl',
          'wget',
          'git',
          'sudo',
          'screen',
          'tree',
          'htop',
          'software-properties-common',
          'ruby2.2'
      ]:
      ensure => installed,
  }

  class { 'ruby':
    version            => '2.2',
    set_system_default => true,
    latest_release     => true,
    require            => Apt::Ppa['ppa:brightbox/ruby-ng'],
  }

  #ruby gems to install
  package {[
          'json'
          ]:
    ensure   => installed,
    provider => 'gem',
  }

  class { 'nrpe': }

}
