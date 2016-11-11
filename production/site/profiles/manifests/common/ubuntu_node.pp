# common for all ubuntu nodes

class profiles::common::ubuntu_node {

  # Ubuntu release sources
  apt::source { "archive.ubuntu.com-${::lsbdistcodename}":
    location => 'http://archive.ubuntu.com/ubuntu',
    key      => '630239CC130E1A7FD81A27B140976EAF437D05B5',
    repos    => 'main universe multiverse restricted',
  }

  apt::source { "archive.ubuntu.com-${::lsbdistcodename}-security":
    location => 'http://archive.ubuntu.com/ubuntu',
    key      => '630239CC130E1A7FD81A27B140976EAF437D05B5',
    repos    => 'main universe multiverse restricted',
    release  => "${::lsbdistcodename}-security"
  }

  apt::source { "archive.ubuntu.com-${::lsbdistcodename}-updates":
    location => 'http://archive.ubuntu.com/ubuntu',
    key      => '630239CC130E1A7FD81A27B140976EAF437D05B5',
    repos    => 'main universe multiverse restricted',
    release  => "${::lsbdistcodename}-updates"
  }

  apt::source { "archive.ubuntu.com-${::lsbdistcodename}-backports":
    location => 'http://archive.ubuntu.com/ubuntu',
    key      => '630239CC130E1A7FD81A27B140976EAF437D05B5',
    repos    => 'main universe multiverse restricted',
    release  => "${::lsbdistcodename}-backports"
  }

}
