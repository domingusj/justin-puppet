node default {

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
