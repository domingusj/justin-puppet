# First off, basic firewall rules
class profiles::firewall::pre {

  $private_network = hiera ('private_network')

    Firewall {
      require => undef,
    }

    # Default firewall rules
    firewall { '000 accept all icmp':
        proto  => 'icmp',
        action => 'accept',
    }

    firewall { '001 accept all to lo interface':
        proto   => 'all',
        iniface => 'lo',
        action  => 'accept',
    }

    firewall { '002 reject local traffic not on loopback interface':
        iniface     => '! lo',
        proto       => 'all',
        destination => '127.0.0.1/8',
        action      => 'reject',
    }

    firewall { '003 accept related established rules':
        proto  => 'all',
        state  => ['RELATED', 'ESTABLISHED'],
        action => 'accept',
    }

    firewall { '004 ssh 22':
        dport  => '22',
        proto  => 'tcp',
        source => $private_network,
        action => 'accept',
    }

    firewall { '005 nrpe 5666':
        dport  => '5666',
        proto  => 'tcp',
        source => $private_network,
        action => 'accept',
    }


    firewall { '997 LOG iptables denied':
      proto      => 'all',
      jump       => 'LOG',
      limit      => '5/min',
      log_prefix => 'iptables denied',
      log_level  => '7',
    }

}
