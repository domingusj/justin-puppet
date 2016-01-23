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
          'build-essential',
      ]:
      ensure => installed,
  }

  package { 'ruby-json':
    ensure   => installed,
    provider => 'gem',
  }

  class { 'ruby':
    version            => '2.2',
    ruby_package       => 'ruby2.2',
    system_default_bin => '/usr/bin/ruby2.2',
    set_system_default => true,
    latest_release     => true,
    gems_version       => 'latest',
    require            => Apt::Ppa['ppa:brightbox/ruby-ng'],
  }

  #ruby gems to install
  package {[
          'json'
          ]:
    ensure   => installed,
    provider => 'gem',
    require  => Apt::Ppa['ppa:brightbox/ruby-ng'],
  }

  class { 'nrpe': }

}
