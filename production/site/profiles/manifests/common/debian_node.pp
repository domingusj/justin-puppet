# common for all debian/ubuntu nodes
class profiles::common::debian_node {

  include apt

  #common debian packages needed everywhere
  package {[
          'vim',
          'curl',
          'wget',
          'git',
          'sudo',
          'screen',
          'tree',
          'htop',
          'software-properties-common',
          'build-essential',
      ]:
      ensure => installed,
  }

  class { 'nrpe': }

}
