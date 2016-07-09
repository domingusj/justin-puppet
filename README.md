### Puppet Vagrant Environment ###

## Setup ##

```gem install r10k```

```vagrant plugin install landrush # for DNS```

```cd production```

```r10k puppetfile install --moduledir=forge```

Add new nodes to the `servers.yaml` file
