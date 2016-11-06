# common for all debian/ubuntu nodes

class profiles::common::debian_node {

  include ::apt

  apt::source { 'puppetlabs':
  location => 'http://apt.puppetlabs.com',
  repos    => 'main',
  key      => {
    'id'     => '47B320EB4C7C375AA9DAE1A01054B7A24BD6EC30',
    'server' => 'pgp.mit.edu',
    },
  }

  # common debian packages needed everywhere
  package {[
          'vim',
          'curl',
          'wget',
          'git',
          'sudo',
          'screen',
          'tree',
          'htop',
          'build-essential',
      ]:
      ensure  => installed,
      require => Class['apt::update']
  }

}
