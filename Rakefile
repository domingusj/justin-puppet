require 'rubygems'
require 'puppet-lint/tasks/puppet-lint'
require 'rake/testtask'


PuppetLint::RakeTask.new :lint do |config|
  config.ignore_paths = [
      '**/modules/apt/**/*',
      '**/modules/concat/**/*',
      '**/modules/curator/**/*',
      '**/modules/docker/**/*',
      '**/modules/epel/**/*',
      '**/modules/postgresql/**/*',
      '**/modules/newrelic/**/*',
      '**/modules/remote_file/**/*',
      '**/modules/ruby/**/*',
      '**/modules/stdlib/**/*',
      '**/modules/sumo/**/*',
      '**/modules/vcsrepo/**/*',
      '**/modules/xinetd/**/*',
      '**/datadog_agent/**/*.pp'
  ]

  config.fail_on_warnings = true
end
