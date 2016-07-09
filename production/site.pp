node default {

  ## environment: (env)
  #case $::domain {
  #  /.*dev.*/: { $env = 'dev' }
  #  default: {fail("Environment ${::domain} is not supported in this site.pp") }
  #}

  ## location
  #case $::domain {
  #  /^.*den\.justindomingus\.com$/: { $location = 'den' }
  #  default: { fail("Location ${::domain} is not supported in this site.pp") }
  #}

  if $::osfamily == 'Debian' {
    include profiles::common::debian_node
  }
  elsif $::osfamily == 'RedHat' {
    include profiles::common::redhat_node
  }
  else {
    fail ("$::osfamily is not yet supported by this Puppet repo")
  }

  include roles::default

  if $::hostname =~ /^puppet\d{1,2}$/   { include roles::puppetserver }
  if $::hostname =~ /^icinga\d{1,2}$/   { include roles::icinga }
  if $::hostname =~ /^graphite\d{1,2}$/ { include roles::graphite }
  if $::hostname =~ /^nagios\d{1,2}$/   { include roles::nagios }
  if $::hostname =~ /^sensu\d{1,2}$/    { include roles::sensu }
  if $::hostname =~ /^web\d{1,2}$/      { include roles::web }

}
