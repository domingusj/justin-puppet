# base profile everyone gets

class profiles::common::base {

  # classification by environment: (env)
  case $::domain {
    /.*dev.*/: { $env = 'dev' }
    default: {fail("Environment ${::domain} is not supported in this site.pp") }
  }

  # classification by location: (location)
  case $::domain {
    /^.*den\.justindomingus\.com$/: { $location = 'den' }
    default: { fail("Location ${::domain} is not supported in this site.pp") }
  }

  class { 'motd':
    content => "# This node is managed by Puppet ${::clientversion}\n# Environment: ${::env}\n# Location: ${::location}\n"
  }

  # common users
  users { 'common': }

  class { '::ntp': }

  # set locale
  class { 'locales':
      default_locale => 'en_US.UTF-8',
      locales        => ['en_US.UTF-8 UTF-8'],
  }

  # classification by OS family
  if $::osfamily == 'Debian' {
    include profiles::common::debian_node
  }
  elsif $::osfamily == 'RedHat' {
    include profiles::common::redhat_node
  }
  else {
    fail("${::osfamily} is not yet supported by this Puppet repo")
  }

  # classification by distro
  if $::facts['os']['distro']['id'] == 'Ubuntu' {
    include profiles::common::ubuntu_node
  }

  # base firewall config
  include profiles::firewall::setup

}
