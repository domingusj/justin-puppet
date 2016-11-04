#hubot server
class profiles::hubot_server {

  class { 'hubot':
    adapter      => 'slack',
    #build_deps    => [ 'libxml2-devel', 'gcc-c++' ],
    env_export   => { 'HUBOT_LOG_LEVEL'   => 'DEBUG',
                      'HUBOT_SLACK_TOKEN' => 'GET-THE-KEY-FROM-HIERA',
                    },
    dependencies => {
      'hubot'         => '>= 2.19.0 < 3.0.0',
      'hubot-scripts' => '>= 2.17.2 < 3.0.0',
      'hubot-slack'   => '>=4.1.0',
    },
  }

}
