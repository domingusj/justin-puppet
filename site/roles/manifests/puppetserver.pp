# puppetserver server role
class roles::puppetserver {
    include profiles::puppetserver_server
    include profiles::puppetdb_server
    include profiles::foreman_server
}
