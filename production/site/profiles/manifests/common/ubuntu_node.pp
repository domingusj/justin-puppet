# common for all ubuntu nodes

class profiles::common::ubuntu_node {

  # Ubuntu release sources
  apt::source { "${::lsbdistcodename}_release":
    comment  => 'Main Ubuntu release',
    location => 'http://us.archive.ubuntu.com/ubuntu',
    release  => $::lsbdistcodename,
    repos    => 'main restricted universe multiverse',
  }

  apt::source { "${::lsbdistcodename}_updates":
    comment  => 'Ubuntu updates',
    location => 'http://us.archive.ubuntu.com/ubuntu',
    release  => "${::lsbdistcodename}-updates",
    repos    => 'main restricted universe multiverse',
  }

  apt::source { "${::lsbdistcodename}_security":
    comment  => 'Ubuntu security updates',
    location => 'http://us.archive.ubuntu.com/ubuntu',
    release  => "${::lsbdistcodename}-security",
    repos    => 'main restricted universe multiverse',
  }

}
