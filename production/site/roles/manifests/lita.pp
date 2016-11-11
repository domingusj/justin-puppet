# lita server role
class roles::lita {
    contain profiles::common::base
    contain profiles::lita_server

    Class['profiles::common::base'] -> Class['profiles::lita_server']
}
