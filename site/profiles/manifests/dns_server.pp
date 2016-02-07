#DNS server
class profiles::dns_server {

$main_domain  = hiera ('main_domain')
$reverse_zone = hiera ('reverse_zone')

  firewall {'005 dns 53':
      dport  => '53',
      proto  => 'udp',
      action => 'accept',
  }

  node $::fqdn {
    include dns::server

    # Forwarders
    dns::server::options { '/etc/bind/named.conf.options':
      forwarders => [ '8.8.8.8', '8.8.4.4' ]
    }

    # Forward Zone
    dns::zone { $main_domain:
      soa         => 'ns1.example.com',
      soa_email   => 'admin.example.com',
      nameservers => ['ns1']
    }

    # Reverse Zone
    dns::zone { '1.168.192.IN-ADDR.ARPA':
      soa         => 'ns1.example.com',
      soa_email   => 'admin.example.com',
      nameservers => ['ns1']
    }

    # A Records:
    dns::record::a {
      'huey':
        zone => 'example.com',
        data => ['98.76.54.32'];
      'duey':
        zone => 'example.com',
        data => ['12.34.56.78', '12.23.34.45'];
      'luey':
        zone => 'example.com',
        data => ['192.168.1.25'],
        ptr  => true; # Creates a matching reverse zone record.  Make sure you've added the proper reverse zone in the manifest.
    }

    # MX Records:
    dns::record::mx {
      'mx,0':
        zone       => 'example.com',
        preference => 0,
        data       => 'ASPMX.L.GOOGLE.com';
      'mx,10':
        zone       => 'example.com',
        preference => 10,
        data       => 'ALT1.ASPMX.L.GOOGLE.com';
    }

    # NS Records:
    dns::record::ns {
      'example.com':
        zone => 'example.com',
        data => 'ns3';
      'delegation-to-ns4-jp-example-net':
        zone => 'example.com',
        host => 'delegated-zone',
        data => 'ns4.jp.example.net.';
    }

    # CNAME Record:
    dns::record::cname { 'www':
      zone => 'example.com',
      data => 'huey.example.com',
    }

    # TXT Record:
    dns::record::txt { 'www':
      zone => 'example.com',
      data => 'Hello World',
    }
  }
}
