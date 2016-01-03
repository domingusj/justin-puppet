# Clears rules and sets up pre and post classes
class profiles::firewall::setup {
    resources { 'firewall':
        purge => true
    }

    Firewall {
        before  => Class['profiles::firewall::post'],
        require => Class['profiles::firewall::pre'],
    }

    class { ['profiles::firewall::pre', 'profiles::firewall::post']: }

    class { 'firewall': }
}

# ~/example.domain.com-inf/puppet/site/profiles/manifests/firewall/pre.pp
# First off, basic firewall rules
class profiles::firewall::pre {
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
        port   => '22',
        proto  => 'tcp',
        action => 'accept',
    }
}

# ~/example.domain.com-inf/puppet/site/profiles/manifests/firewall/post.pp
# Last in firewall rules
class profiles::firewall::post {
    firewall { '998 drop all':
        chain  => 'INPUT',
        proto  => 'all',
        action => 'drop',
        before => undef,
    }

    firewall { '999 drop all':
        chain  => 'FORWARD',
        proto  => 'all',
        action => 'drop',
        before => undef,
    }
}
