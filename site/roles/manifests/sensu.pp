# sensu server role
class roles::sensu {
    include profiles::sensu_server
    include profiles::rabbitmq_server
    include profiles::redis_server
}
