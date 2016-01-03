#DNS server
class profiles::dns_server {

$main_domain = hiera ('main_domain')
$reverse_zone = hiera ('reverse_zone')

  firewall {'005 dns 53':
      dport  => '53',
      proto  => 'udp',
      action => 'accept',
  }

  package { 'bind9':
    ensure => installed,
  }

  service { 'bind9':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
  }

  file { 'forward_dns':
    ensure => file,
    path   => "/etc/bind/zones/db.${main_domain}",
    mode   => '0644',
    owner  => 'root',
    group  => 'bind',
    source => "puppet:///modules/profiles/dns_server/db.${main_domain}",
    notify => Service['bind9'],
  }

  file { 'reverse_dns':
    ensure => file,
    path   => "/etc/bind/zones/db.${reverse_zone}",
    mode   => '0644',
    owner  => 'root',
    group  => 'bind',
    source => "puppet:///modules/profiles/dns_server/db.${reverse_zone}",
    notify => Service['bind9'],
  }

}
