node default {
  include roles::default

  if $::hostname =~ /^puppet\d{1,2}$/ { include roles::puppetserver }
  if $::hostname =~ /^core1$/ { include roles::core }
  if $::hostname =~ /^icinga\d{1,2}$/ { include roles::icinga }
  if $::hostname =~ /^graphite\d{1,2}$/ { include roles::graphite }
  if $::hostname =~ /^nagios\d{1,2}$/ { include roles::nagios }
}
