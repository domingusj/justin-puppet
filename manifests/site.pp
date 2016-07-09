node default {

  ## environment: (env)
  #case $::domain {
    #/.*dev.*/: { $env = 'dev' }
    #default: {fail("Domain ${::domain} is not supported in this site.pp") }
  #}

  ## location
  #case $::domain {
    #/^.*den\.justindomingus\.comt$/: { $location = 'den' }
    #default: { fail("Domain ${::domain} is not supported in this site.pp") }
  #}

  include roles::default

  if $::hostname =~ /^puppet\d{1,2}$/   { include roles::puppetserver }
  if $::hostname =~ /^core1$/           { include roles::core }
  if $::hostname =~ /^icinga\d{1,2}$/   { include roles::icinga }
  if $::hostname =~ /^graphite\d{1,2}$/ { include roles::graphite }
  if $::hostname =~ /^nagios\d{1,2}$/   { include roles::nagios }
  if $::hostname =~ /^sensu\d{1,2}$/    { include roles::sensu }

}
