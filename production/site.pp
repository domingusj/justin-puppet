node default {

  # classification by environment: (env)
  case $::domain {
    /.*dev.*/: { $env = 'dev' }
    default: {fail("Environment ${::domain} is not supported in this site.pp") }
  }

  # classification by location
  case $::domain {
    /^.*den\.justindomingus\.com$/: { $location = 'den' }
    default: { fail("Location ${::domain} is not supported in this site.pp") }
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

  # every node should get the default role and base profile
  include roles::default

  # classification by hostname, which determines specific role
  if $::hostname =~ /^puppet\d{1,2}$/   { include roles::puppetserver }
  if $::hostname =~ /^icinga\d{1,2}$/   { include roles::icinga }
  if $::hostname =~ /^graphite\d{1,2}$/ { include roles::graphite }
  if $::hostname =~ /^nagios\d{1,2}$/   { include roles::nagios }
  if $::hostname =~ /^sensu\d{1,2}$/    { include roles::sensu }
  if $::hostname =~ /^web\d{1,2}$/      { include roles::web }
  if $::hostname =~ /^hubot\d{1,2}$/    { include roles::hubot }
  if $::hostname =~ /^lita\d{1,2}$/     { include roles::lita }

}
