# lita server

class profiles::lita_server {

  $lita_slack_token = hiera('lita_slack_token')
  $lita_ruby_version = '2.2.5'

  user { 'lita':
    ensure  => present,
    comment => 'lita chat bot',
    home    => '/opt/lita',
    system  => true,
    shell   => '/bin/bash',
  }

  file { '/opt/lita/.ruby-version':
    ensure  => file,
    mode    => '0644',
    owner   => 'lita',
    group   => 'lita',
    content => $lita_ruby_version,
  }


  file { '/opt/lita/Gemfile':
    ensure  => file,
    mode    => '0644',
    owner   => 'lita',
    group   => 'lita',
    content => template('profiles/lita_server/Gemfile.erb'),
  }

  file { '/opt/lita/lita_config.rb':
    ensure  => file,
    mode    => '0644',
    owner   => 'lita',
    group   => 'lita',
    content => template('profiles/lita_server/lita_config.rb.erb'),
    notify  => Service['lita'],
  }

  service { 'lita':
    ensure => running,
    enable => true,
    flags  => '-c /opt/lita/lita_config.rb',
  }
}
