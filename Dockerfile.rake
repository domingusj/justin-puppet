FROM debian:jessie
WORKDIR /tmp
RUN apt-get update && apt-get install -y wget git && \
    wget https://apt.puppetlabs.com/puppetlabs-release-pc1-jessie.deb && \
    dpkg -i puppetlabs-release-pc1-jessie.deb && \
    apt-get update && apt-get install -y puppet-agent
RUN /opt/puppetlabs/puppet/bin/gem install puppet-lint -v 2.0.2

ENTRYPOINT ["/opt/puppetlabs/puppet/bin/rake"]
