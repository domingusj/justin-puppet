node default {
  include roles::default

  if $::hostname =~ /^core\d{1,2}$/ { include roles::core }

}
